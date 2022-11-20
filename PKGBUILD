# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-testtools
pkgver=2.5.0
pkgrel=3
pkgdesc="Extensions to the Python standard library unit testing framework"
arch=('any')
license=('MIT')
url="https://github.com/testing-cabal/testtools"
depends=('python38-pbr' 'python38-extras' 'python38-fixtures')
makedepends=('python38-setuptools')
checkdepends=('python38-testscenarios')
source=("https://github.com/testing-cabal/testtools/archive/$pkgver/$pkgname-$pkgver.tar.gz"
        $pkgname-python38.patch::https://github.com/testing-cabal/testtools/commit/ec9bb7ed0265.patch)
sha512sums=('81e2a31f34461aefa52a553966deb979e2cc8632c0fe2b87640925958d403598e45a3a16eb35d583894fac507670b349cebae002ae5376185e86032ebfb5da80'
            'd1e9763a3fa5ef66666f28687e5c798c2d92c6eb73f702f216b125ef15f5eb10e100da8836e81a6dc0748f1cb8887c92647a29f0e615413d5c371653910f0573')

export PBR_VERSION=$pkgver

prepare() {
  cd testtools-$pkgver
  patch -Np1 -i ../$pkgname-python38.patch
}

build() {
  cd testtools-$pkgver
  python3.8 setup.py build
}

check() {
  cd testtools-$pkgver
  python3.8 -m testtools.run testtools.tests.test_suite
}

package() {
  cd testtools-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

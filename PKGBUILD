# Maintainer:   Sian1468 <setthawut DOT a AT protonmail DOT com>
# Contributor:  Julien Nicoulaud <julien DOT nicoulaud AT gmail DOT com>

pkgname=ffmpeg-normalize
pkgver=1.22.0
pkgrel=1
pkgdesc="Audio normalization using ffmpeg."
arch=(any)
url="https://github.com/slhck/ffmpeg-normalize"
license=(MIT)
depends=('ffmpeg' 'ffmpeg-progress-yield' 'python-tqdm' 'python-colorama')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
conflicts=("${pkgname}-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha512sums=('5d20c9bb616a898484d9ce5f404b5f00ed90caf911194eb93071cd90dee0a9b67f0a1c4aec71939d2be5b2f4037b17c8bcbbe69f1610cb2cb22a18ff685c4f9f')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}
check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python test/test.py
}
package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

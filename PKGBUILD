# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: xRemaLx <anton.komolov@gmail.com>

pkgname=python-klein
pkgver=20.6.0
pkgrel=3
arch=(any)
pkgdesc='A web micro-framework built on werkzeug and twisted.web'
url='https://github.com/twisted/klein'
license=(MIT)
depends=(python python-attrs python-hyperlink python-incremental python-six
         python-tubes python-twisted python-werkzeug python-zope-interface)
makedepends=(python-setuptools)
checkdepends=(python-hypothesis python-treq python-pytest)
source=("https://github.com/twisted/klein/archive/$pkgver/klein-$pkgver.tar.gz"
        "fix-tests.diff")
sha512sums=('1cba04a365fd9c7185e2f2472f617f875ee9cec41ac97940dda4a145811cefcbbe34f11e1f306656dc43d88b49e66bfcb5efb72d25283bbc8a0729b2fc5e2fca'
            'bbe07e6c9f067265cb962654930632707d61b046709907711ceeaea8b1e691b6cee54b75b1602e2f636251e4a82dd662524dc12e6fb877ef12b7474b9e6e6874')

prepare() {
  cd klein-$pkgver
  patch -Np1 -i ../fix-tests.diff
}

build() {
  cd klein-$pkgver
  python setup.py build
}

check() {
  cd klein-$pkgver
  pytest src/klein/test
}

package() {
  cd klein-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}

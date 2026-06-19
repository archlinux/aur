# Maintainer: stef204 < base64 -d c3RlZjIwNEB5YW5kZXguY29tCg== >

# NOTE: This package downloads from the master branch at pinned commit 089fb1d.
# Please verify the PKGBUILD and checksums before building, as is good
# practice with all AUR packages.

pkgname=trowser-qt5
pkgver=089fb1d
pkgrel=4
pkgdesc="Browser for large line-oriented text files with color highlighting and flexible search"
arch=('x86_64')
url="https://github.com/tomzox/trowser"
license=('GPL3')
depends=('qt5-base')
provides=('trowser')
conflicts=('trowser')
_commit=089fb1d0d22708f418952b7a1511e0018d8d8272
source=("$pkgname-$pkgver.tar.gz::https://github.com/tomzox/trowser/archive/${_commit}.tar.gz"
        "trowser.desktop"
        "trowser.png")
sha256sums=('b2659278d8dfcac0425e839883b21b3bfdde527e3d47a29ad466d1938df40d8a'
            '1a607cd0c9fcfecbabd4b96cb7d8d364ce2875dab5b437cc1fe5565bf6bd0b8e'
            'ea9155bb814d9a7680395dfccc71f97f70a8573686ebb3e25d1bd50d7bad0963')

build() {
  cd "$srcdir/trowser-${_commit}/src_qt"
  qmake
  make
}

package() {
  install -Dm755 "$srcdir/trowser-${_commit}/src_qt/build/trowser" \
    "$pkgdir/usr/bin/trowser"
  install -Dm644 "$srcdir/trowser-${_commit}/LICENSE" \
    "$pkgdir/usr/share/licenses/trowser/LICENSE"
  install -Dm644 "$srcdir/trowser-${_commit}/doc/trowser.1" \
    "$pkgdir/usr/share/man/man1/trowser.1"
  install -Dm644 "$srcdir/trowser.desktop" \
    "$pkgdir/usr/share/applications/trowser.desktop"
  install -Dm644 "$srcdir/trowser.png" \
    "$pkgdir/usr/share/pixmaps/trowser.png"
}

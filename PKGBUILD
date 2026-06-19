# Maintainer: stef204 < base64 -d c3RlZjIwNEB5YW5kZXguY29tCg== >

# NOTE: This split package builds all three frontends (Qt5, Python, Tcl).
# For a standalone Qt5-only package, see 'trowser-qt5' in the AUR.
# This package downloads from the master branch at pinned commit 089fb1d.
# Please verify the PKGBUILD and checksums before building, as is good
# practice with all AUR packages.

pkgbase=trowser
pkgname=('trowser' 'trowser-python' 'trowser-tcl')
pkgver=089fb1d
pkgrel=1
pkgdesc="Browser for large line-oriented text files with color highlighting and flexible search"
arch=('x86_64')
url="https://github.com/tomzox/trowser"
license=('GPL3')
makedepends=('qt5-base')
_commit=089fb1d0d22708f418952b7a1511e0018d8d8272
source=("$pkgbase-$pkgver.tar.gz::https://github.com/tomzox/trowser/archive/${_commit}.tar.gz"
        "trowser.desktop"
        "trowser-python.desktop"
        "trowser-tcl.desktop"
        "trowser.png")
sha256sums=('b2659278d8dfcac0425e839883b21b3bfdde527e3d47a29ad466d1938df40d8a'
            '0c8738714ff3efb1ba34322dfc3b44638b88915a66d7ba7ccd3ea7fbd652850d'
            '3572a7325fb37766d7e8221b3cf08f799283a2332829331da53c5b408417644c'
            'd2e0c1d60e7d3668d860999f5e32ed1824a1422e154fc4fe7d7610f55c4da398'
            'ea9155bb814d9a7680395dfccc71f97f70a8573686ebb3e25d1bd50d7bad0963')

build() {
  cd "$srcdir/trowser-${_commit}/src_qt"
  qmake
  make
}

package_trowser() {
  depends=('qt5-base')
  conflicts=('trowser-qt5')

  install -Dm755 "$srcdir/trowser-${_commit}/src_qt/build/trowser" \
    "$pkgdir/usr/bin/trowser"
  install -Dm644 "$srcdir/trowser-${_commit}/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/trowser-${_commit}/doc/trowser.1" \
    "$pkgdir/usr/share/man/man1/trowser.1"
  install -Dm644 "$srcdir/trowser.desktop" \
    "$pkgdir/usr/share/applications/trowser.desktop"
  install -Dm644 "$srcdir/trowser.png" \
    "$pkgdir/usr/share/pixmaps/trowser.png"
}

package_trowser-python() {
  depends=('python' 'tk')

  install -Dm755 "$srcdir/trowser-${_commit}/trowser.py" \
    "$pkgdir/usr/bin/trowser.py"
  install -Dm644 "$srcdir/trowser-${_commit}/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/trowser-${_commit}/doc/trowser.1" \
    "$pkgdir/usr/share/man/man1/trowser-python.1"
  install -Dm644 "$srcdir/trowser-python.desktop" \
    "$pkgdir/usr/share/applications/trowser-python.desktop"
  install -Dm644 "$srcdir/trowser.png" \
    "$pkgdir/usr/share/pixmaps/trowser-python.png"
}

package_trowser-tcl() {
  depends=('tk')

  install -Dm755 "$srcdir/trowser-${_commit}/trowser.tcl" \
    "$pkgdir/usr/bin/trowser.tcl"
  install -Dm644 "$srcdir/trowser-${_commit}/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/trowser-${_commit}/doc/trowser.1" \
    "$pkgdir/usr/share/man/man1/trowser-tcl.1"
  install -Dm644 "$srcdir/trowser-tcl.desktop" \
    "$pkgdir/usr/share/applications/trowser-tcl.desktop"
  install -Dm644 "$srcdir/trowser.png" \
    "$pkgdir/usr/share/pixmaps/trowser-tcl.png"
}

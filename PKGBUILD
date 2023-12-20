# Maintainer: Sandro Kalbermatter <info.kalsan [ät-symbol] valaiscom.ch>
# Maintainer: m8D2 <omui (at) proton mail (dot) com>

pkgname=f3-qt-git
pkgver=2.1.0.r16.g10ab886
pkgrel=3
pkgdesc="A simple GUI for F3 - Fight Flash Fraud."
arch=(i686 x86_64)
url="https://github.com/zwpwjwtz/f3-qt"
license=('GPL3')
makedepends=(git)
depends=(f3 qt5-base)
provides=(f3-qt)
conflicts=(f3-qt)
source=('git+https://github.com/zwpwjwtz/f3-qt.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/f3-qt"

  # cutting off 'v' prefix that presents in the git tag
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/f3-qt"
}

build() {
  cd "$srcdir/f3-qt"
  qmake -config release
  make
}

package() {
  cd "$srcdir/f3-qt"
  install -Dm755 "$srcdir/f3-qt/f3-qt" "$pkgdir/usr/bin/f3-qt"
  install -Dm644 "$srcdir/f3-qt/f3-qt.desktop" "$pkgdir/usr/share/applications/f3-qt.desktop"
}

# vim:set ts=8 sts=2 sw=2 et:

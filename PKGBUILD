# Maintainer: VicSanRoPe <kde.sp90x@simplelogin.com>
# Maintainer: Ben <crushedtortilla at gmail dot com>
pkgname=skanpage-git
pkgver=v24.01.90.r37.gca71336
pkgrel=1
pkgdesc="KDE multi-page document scanning application (git version)"
arch=(x86_64)
url="https://invent.kde.org/utilities/skanpage"
license=(GPL)
depends=(ksanecore-git kirigami2 purpose tesseract kquickimageeditor)
makedepends=(git extra-cmake-modules)
conflicts=('skanpage')
provides=('skanpage')
source=('git+https://invent.kde.org/utilities/skanpage.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S ${pkgname%-git} -DBUILD_TESTING=OFF -DCMAKE_BUILD_TYPE=RelWithDebInfo
  cmake --build build
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir/" install
}

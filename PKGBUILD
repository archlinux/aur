# Maintainer: Wynne Plaga <rwplaga dot linux at gmail dot com>

pkgname=kwin-effects-sliding-notifications-git
_reponame=kwin-effects-sliding-notifications
pkgver=12.949a756
pkgrel=1
pkgdesc="Sliding animation for notification windows"
arch=('any')
url="https://github.com/zzag/kwin-effects-sliding-notifications"
#license=('MIT')
depends=('kwin')
makedepends=('git' 'cmake' 'extra-cmake-modules')
source=("git+https://github.com/zzag/kwin-effects-sliding-notifications.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_reponame"
    printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_reponame"

    mkdir -p build
    cd build
    cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "$srcdir/$_reponame/build"
    make DESTDIR="$pkgdir/" install
}


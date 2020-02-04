# Maintainer: Max Reitz <xanclic at xanclic dot moe>
pkgname=krunner-mpd-git
pkgver=r47.540151e
pkgrel=1
pkgdesc="KRunner plugin to control an MPD server"
arch=('any')
url="https://github.com/XanClic/krunner-mpd"
license=('GPL3')
depends=('dbus'
         'plasma-workspace'
         'ruby'
         'ruby-dbus'
         'ruby-i18n'
         'ruby-locale'
         'ruby-ruby-mpd')
makedepends=('coreutils'
             'kdelibs4support'
             'make')
provides=('krunner-mpd')
conflicts=('krunner-mpd')
install=$pkgname.install
source=("$pkgname::git://github.com/XanClic/krunner-mpd.git")
md5sums=('SKIP')

build() {
    cd "$pkgname"
    ./configure --prefix=/usr --skip-bundle-install
    make
}

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$pkgname"
    make DESTDIR="$pkgdir/" install
}

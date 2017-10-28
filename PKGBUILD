# Maintainer: Jordy van Wolferen <jordy@jvwdev.nl>

pkgname=xfce4-volumed-pulse-git
pkgdesc='A volume keys control daemon for Xfce using pulseaudio'
pkgver=r83.faec2e8
pkgrel=1
arch=('x86_64')
license=('GPL3')
url="https://git.xfce.org/apps/xfce4-volumed-pulse"

conflicts=('xfce4-volumed' 'xfce4-volumed-pulse')
replaces=('xfce4-volumed' 'xfce4-volumed-pulse')

depends=('libnotify' 'pulseaudio' 'libkeybinder3' 'xfconf')
optdepends=('xfce4-notifyd: for OSD notifications')
makedepends=('git' 'xfce4-dev-tools')

source=("${pkgname%-git}::git://git.xfce.org/apps/xfce4-volumed-pulse")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    ./autogen.sh
    ./configure --prefix=/usr --sysconfdir=/etc \
                --libexecdir=/usr/lib \
                --localstatedir=/var
    make
}

package() {
    cd "$srcdir/${pkgname%-git}"
    make DESTDIR="$pkgdir" install
}

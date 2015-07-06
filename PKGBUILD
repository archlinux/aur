# Maintainer: melchips <truphemus dot francois at gmail dot com>

pkgname=notify-sharp-git
_gitname=notify-sharp
pkgver=3.0.0.r0.gc94bcc9
pkgrel=1
pkgdesc="C-sharp client implementation for Desktop Notifications, i.e. notification-daemon"
arch=('i686' 'x86_64')
url="https://git.gnome.org/browse/notify-sharp/"
license=('MIT')
depends=('mono' 'gtk-sharp-git')
makedepends=('git')
options=('!libtool')
provides=('notify-sharp')
conflicts=('notify-sharp')
source=("$_gitname"::'git://git.gnome.org/notify-sharp')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_gitname"
    git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_gitname"

  msg2 "Starting make..."
  ./autogen.sh --prefix=/usr
  make || return 1
}

package() {
    cd ${srcdir}/${_gitname}
    make DESTDIR=${pkgdir} install || return 1
    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

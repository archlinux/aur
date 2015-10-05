# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>
_pkgname=pasystray
pkgname=${_pkgname}-git
pkgver=0.5.2.r17.gdd927f3
pkgrel=1
pkgdesc="PulseAudio system tray (a replacement for padevchooser)"
arch=('i686' 'x86_64')
url="https://github.com/christophgysin/pasystray"
license=('LGPL')
groups=('multimedia')
depends=('libpulse' 'gtk3' 'libnotify' 'avahi' 'libx11' 'gnome-icon-theme'
    'gtk-update-icon-cache')
makedepends=('git' 'pkg-config' )
optdepends=(
    'paman: Launch PulseAudio manager from tray icon'
    'pavucontrol: Launch PulseAudio mixer from tray icon'
    'pavumeter: Launch PulseAudio volume meter from tray icon'
    'paprefs: Launch PulseAudio preferences from tray icon'
)
provides=('pasystray')
conflicts=('pasystray')
install='pasystray.install'
source=(git+https://github.com/christophgysin/pasystray.git)
md5sums=('SKIP')

pkgver() {
    cd $_pkgname
    git describe --long | sed -r "s/^${pkgname%-git}-//;s/([^-]*-g)/r\\1/;s/-/./g"
}

build() {
    cd "$srcdir/$_pkgname"

    aclocal
    autoconf
    autoheader
    automake --add-missing
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc
}

package() {
    cd "$srcdir/$_pkgname"
    make DESTDIR="$pkgdir/" install
}

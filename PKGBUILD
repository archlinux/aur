# Maintainer: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Alexandre Filgueira <alexfilgueira@cinnarch.com>
# Based on gnome-screensaver package:
# Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Jan de Groot <jgc@archlinux.org>

pkgname=cinnamon-screensaver-git
pkgver=4.0.3
pkgrel=1
pkgdesc="Screensaver designed to integrate well with the Cinnamon desktop."
arch=('i686' 'x86_64')
url="https://github.com/linuxmint/${pkgname%-git}"
license=('GPL')
depends=('accountsservice' 'cinnamon-desktop' 'dbus-glib' 'libgnomekbd'
         'python-cairo' 'python-gobject' 'python-setproctitle' 'python-xapp' 'xapps')
optdepends=('cinnamon-translations: i18n')
makedepends=('git' 'gobject-introspection' 'intltool')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
backup=('etc/pam.d/cinnamon-screensaver')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}"/${pkgname%-git}

    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}"/${pkgname%-git}

    autoreconf -fi
}

build() {
    cd "${srcdir}"/${pkgname%-git}

    ./configure --prefix=/usr \
                --sysconfdir=/etc \
                --libexecdir=/usr/lib/cinnamon-screensaver \
                --localstatedir=/var
    make
}

package() {
    cd "${srcdir}"/${pkgname%-git}

    make DESTDIR="${pkgdir}" install
}

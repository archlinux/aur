# Maintainer: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Alexandre Filgueira <alexfilgueira@cinnarch.com>
# Based on gnome-screensaver package:
# Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Jan de Groot <jgc@archlinux.org>

pkgname=cinnamon-screensaver-git
pkgver=4.4.1.r9.gd3db5dc
pkgrel=1
pkgdesc="Screensaver designed to integrate well with the Cinnamon desktop."
arch=('i686' 'x86_64')
url="https://github.com/linuxmint/${pkgname%-git}"
license=('GPL')
depends=('accountsservice' 'cinnamon-desktop' 'dbus-glib' 'libgnomekbd'
         'python-cairo' 'python-gobject' 'python-setproctitle' 'python-xapp' 'xapps')
optdepends=('cinnamon-translations: i18n')
makedepends=('git' 'meson' 'samurai' 'gobject-introspection')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
backup=('etc/pam.d/cinnamon-screensaver')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}"/${pkgname%-git}

    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    mkdir -p "${srcdir}"/${pkgname%-git}/build
    cd "${srcdir}"/${pkgname%-git}/build

    meson --prefix=/usr \
          --libexecdir=lib/cinnamon-screensaver \
          --buildtype=plain \
          ..
    samu
}

package() {
    cd "${srcdir}"/${pkgname%-git}/build

    DESTDIR="${pkgdir}" samu install
}

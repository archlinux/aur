# Maintainer: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Alexandre Filgueira <alexfilgueira@antergos.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=cinnamon-session-git
pkgver=4.4.1.r1.ga582be4
pkgrel=1
pkgdesc="The Cinnamon Session Handler"
arch=('i686' 'x86_64')
url="https://github.com/linuxmint/${pkgname%-git}"
license=('GPL' 'LGPL')
depends=('cinnamon-desktop' 'dbus-glib' 'libsm' 'libcanberra' 'xapps')
optdepends=('cinnamon-translations: i18n')
makedepends=('git' 'meson' 'samurai' 'xtrans')
provides=("${pkgname%-git}=${pkgver}")
conflicts=("${pkgname%-git}")
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
          --libexecdir=lib/${pkgname%-git} \
          --buildtype=plain \
          -Dgconf=false \
          -Ddocbook=false \
          ..
    samu
}

package() {
    cd "${srcdir}"/${pkgname%-git}/build

    DESTDIR="${pkgdir}" samu install
}

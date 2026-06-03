# Maintainer: Capricornus007 <Capricornus007 at proton dot me>
# Co-Maintainer: Ted Alff <twa022 at gmail dot com>
# Co-Maintainer: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Alexandre Filgueira <alexfilgueira@cinnarch.com>
# Based on gnome-control-center:
# Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Jan de Groot <jgc@archlinux.org>

pkgname=cinnamon-control-center-git
pkgver=6.7.1.unstable.r0.g5fb7b03
pkgrel=1
pkgdesc="The Control Center for Cinnamon"
arch=('i686' 'x86_64')
url="https://github.com/linuxmint/${pkgname%-git}"
license=('GPL')
depends=('cinnamon-settings-daemon>=4.4.0.r9.g206ce2d' 'cinnamon-menus' 'colord'
         'libgnomekbd' 'libmm-glib' 'nm-connection-editor')
optdepends=('cinnamon-translations: i18n'
            'gnome-color-manager: for color management tasks'
            'gnome-online-accounts: for the online accounts module')
makedepends=('git' 'gnome-online-accounts' 'python' 'meson')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!emptydirs')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}"/${pkgname%-git}
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    :
}

build() {
    arch-meson "${srcdir}/${pkgname%-git}" build
    meson compile -C build
}

package() {
    DESTDIR="${pkgdir}" meson install -C build
    install -d -o root -g 102 -m 750 "${pkgdir}"/usr/share/polkit-1/rules.d
}

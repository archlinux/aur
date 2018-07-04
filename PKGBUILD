# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: aericson <de.ericson at gmail dot com>
# Contributor: Rorschach <r0rschach at lavabit dot com>
# Contributor: Andrew Kravchuk <awkravchuk at gmail dot com>
#
pkgname="aarchup"
pkgver=1.8.1
pkgrel=2
pkgdesc="Fork of archup a small and lightweight update-notifier for archlinux."
url="https://github.com/aericson/aarchup"
arch=('i686' 'x86_64')
license=('GPL3')
provides=("${pkgname}")
depends=('libnotify' 'gtk2')
makedepends=('libnotify' 'autoconf' 'gzip')
backup=('etc/systemd/system/aarchup.timer')
optdepends=('auracle: AUR support(--aur)')
install='aarchup.install'
source=("${pkgname}-${pkgver}.zip::${url}/archive/${pkgver}.zip"
        '0001-aarchup.c-switch-to-auracle-sync.patch'
)
sha256sums=('9d96df312502ac61379678a7297dd1c40b045709054c66691e3680fa389096fe'
            'e1d0e0cacabd2f13be23a570320fbad37619d6f752e524f94e791871c7ca28b6')

prepare() {
    mv -v "${pkgname}-${pkgver}"/src/* "${pkgname}-${pkgver}"
    rmdir "${pkgname}-${pkgver}"/src
}

build() {
    cd "${pkgname}-${pkgver}"
    patch -p1 < ../0001-aarchup.c-switch-to-auracle-sync.patch
    autoconf
    ./configure --prefix=/usr
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}

# vim: set ts=4 sw=4 et syn=sh ft=sh:

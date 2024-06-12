# Maintainer: Santiago Burgos <santiago.burgos1089@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Fabian Bornschein <fabiscafe@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=file-roller-linuxmint
_pkgname=file-roller
pkgver=43.0
_pkgver=wilma
pkgrel=1
pkgdesc="Create and modify archives. Linux Mint version"
url="https://wiki.gnome.org/Apps/FileRoller"
arch=(x86_64)
license=(GPL-2.0-or-later)
depends=(
    'dconf'
    'file'
    'gcc-libs'
    'glib2'
    'glibc'
    'gtk3'
    'hicolor-icon-theme'
    'json-glib'
    'libarchive'
    'libportal'
    'pango'
    'unzip'
    'zip'
)
makedepends=(
    'appstream-glib'
    'libnautilus-extension'
    'meson'
    'yelp-tools'
)
provides=(
    ${_pkgname}
    file-roller-gtk3
)
conflicts=(
    ${_pkgname}
    file-roller-gtk3
)
optdepends=(
    'lrzip: lrzip archive support'
    'p7zip: 7z, arj, exe and encrypted zip files support'
    'squashfs-tools: squashfs image support'
    'unace: ACE archive support'
    'unrar: better RAR archive support'
)
source=("http://packages.linuxmint.com/pool/upstream/f/${_pkgname}/${_pkgname}_${pkgver}-${pkgrel}+${_pkgver}.tar.xz")
sha256sums=('e2e7aa74753fe1c1735f610f108ed2195cb90948950fe27a0e00ad43359e98e9')

prepare() {
    cd $_pkgname
}

build() {
    arch-meson $_pkgname build
    meson compile -C build
}

check() {
    meson test -C build --print-errorlogs
}

package() {
    meson install -C build --destdir "$pkgdir"
}

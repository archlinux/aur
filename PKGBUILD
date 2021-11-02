# Maintainer: Leonidas Spyropoulos <artafinde at gmail dot com>
# Contributor: ValHue <vhuelamo at gmail dot com>
# Contributor: aericson <de.ericson at gmail dot com>
# Contributor: Rorschach <r0rschach at lavabit dot com>
# Contributor: Andrew Kravchuk <awkravchuk at gmail dot com>
#
pkgname="aarchup"
pkgver=2.1.7
pkgrel=3
pkgdesc="Fork of archup a small and lightweight update-notifier for archlinux."
url="https://gitlab.com/artafinde/aarchup/"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('libnotify' 'pacman-contrib')
makedepends=('meson' 'ninja' 'gzip')
optdepends=('auracle: AUR support(--aur)')
source=("${pkgname}-${pkgver}.tar.gz::${url}/-/archive/${pkgver}/aarchup-${pkgver}.tar.gz")
b2sums=('dc766f7c126e91ac389fc3644f2ea487158bc0f26a68e923d99e6bedb45fca9a600418b87f66765f038bc9a4edd074cf52ae3fcc4dd3b981ba8b8e00b685d091')

build() {
    cd "${pkgname}-${pkgver}"
    local meson_args=(
      --prefix=/usr
      --buildtype=plain
      --default-library=static
    )
    [[ -d build ]] && meson_args+=(--wipe)
    meson build "${meson_args[@]}"
    meson compile -C build
}

package() {
    cd "${pkgname}-${pkgver}"
    DESTDIR="$pkgdir" meson install -C build
}

# vim: set ts=4 sw=4 et syn=sh ft=sh:

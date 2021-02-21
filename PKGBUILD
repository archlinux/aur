# Maintainer: Leonidas Spyropoulos <artafinde at gmail dot com>
# Contributor: ValHue <vhuelamo at gmail dot com>
# Contributor: aericson <de.ericson at gmail dot com>
# Contributor: Rorschach <r0rschach at lavabit dot com>
# Contributor: Andrew Kravchuk <awkravchuk at gmail dot com>
#
pkgname="aarchup"
pkgver=2.1.6
pkgrel=1
pkgdesc="Fork of archup a small and lightweight update-notifier for archlinux."
url="https://gitlab.com/artafinde/aarchup/"
arch=('i686' 'x86_64')
license=('GPL3')
provides=("${pkgname}")
depends=('libnotify' 'gtk2' 'pacman-contrib')
makedepends=('libnotify' 'meson' 'ninja' 'gzip' 'git')
optdepends=('auracle: AUR support(--aur)')
source=("${pkgname}-${pkgver}.tar.gz::${url}/-/archive/${pkgver}/aarchup-${pkgver}.tar.gz")
b2sums=('d3ebc415fb7668863441036f2de59d78c7fac3079f8b49f681b4237d243f02686a6bc75552b8b377581b280466dd8fde393e61a992a9b06063986b8d1fcd5310')

build() {
    cd "${pkgname}-${pkgver}"
    local meson_args=(
      --prefix=/usr
      --buildtype=plain
      --default-library=static
    )
    [[ -d build ]] && meson_args+=(--wipe)
    meson build "${meson_args[@]}"
    ninja -C build
}

package() {
    cd "${pkgname}-${pkgver}"
    DESTDIR="$pkgdir" ninja -C build install
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set ts=4 sw=4 et syn=sh ft=sh:

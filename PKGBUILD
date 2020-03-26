# Maintainer: Leonidas Spyropoulos <artafinde at gmail dot com>
# Contributor: ValHue <vhuelamo at gmail dot com>
# Contributor: aericson <de.ericson at gmail dot com>
# Contributor: Rorschach <r0rschach at lavabit dot com>
# Contributor: Andrew Kravchuk <awkravchuk at gmail dot com>
#
pkgname="aarchup"
pkgver=2.1.5
pkgrel=2
pkgdesc="Fork of archup a small and lightweight update-notifier for archlinux."
url="https://gitlab.com/artafinde/aarchup/"
arch=('i686' 'x86_64')
license=('GPL3')
provides=("${pkgname}")
depends=('libnotify' 'gtk2')
makedepends=('libnotify' 'meson' 'ninja' 'gzip' 'git')
optdepends=('auracle: AUR support(--aur)')
source=("${pkgname}-${pkgver}.tar.gz::${url}/-/archive/${pkgver}/aarchup-${pkgver}.tar.gz")
sha256sums=('5e39e15a5f1106fe35f8b8644793042a47482fed7ab29ea93b56c8162267e42d')

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

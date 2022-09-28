# Maintainer: gigablaster <gigakek [at] protonmail [dot] com>
# Contributor: Davide Depau <davide@depau.eu>

pkgname=xdg-desktop-portal-wlr-artix
pkgver=0.6.0
pkgrel=1
pkgdesc='xdg-desktop-portal backend for wlroots, build without systemd'
url=https://github.com/emersion/xdg-desktop-portal-wlr
arch=(x86_64)
license=(MIT)
provides=("${pkgname%}" "xdg-desktop-portal-impl")
conflicts=("${pkgname%}" "xdg-desktop-portal-wlr-git" "xdg-desktop-portal-wlr")
depends=(xdg-desktop-portal pipewire libinih)
makedepends=(git meson wayland-protocols wayland scdoc)
optdepends=(
  "grim: required for the screenshot portal to function"
  "slurp: support for interactive mode for the screenshot portal; one of the built-in chooser options for the screencast portal"
  "bemenu: one of the built-in chooser options for the screencast portal"
  "wofi: one of the built-in chooser options for the screencast portal"
  "obs-xdg-portal: support for the screencast portal in obs"
)

source=(
  "${url}/releases/download/v${pkgver}/xdg-desktop-portal-wlr-${pkgver}.tar.gz"
)

sha512sums=(
    'e325c2de2a98ffc4612da3492138843b6c9927e536f52f7a87e794380c099f84ab8d344ee989bf88e71faaad2e5300fc31ac74058cea5040654ac74ce270ee53'
)

build () {
    local meson_options=(
      -D sd-bus-provider=libelogind
      -D systemd=disabled
    )
	rm -rf build
	arch-meson "xdg-desktop-portal-wlr-${pkgver}" build "${meson_options[@]}"
	ninja -C build
}

package () {
	DESTDIR="${pkgdir}" ninja -C build install
}


# Maintainer: HyDE-Project <contact@hyde-project.org>
# shellcheck shell=bash

pkgname=sddm-hyprland
pkgver=0.r22.g3c5fab5
pkgrel=1
pkgdesc="SDDM Wayland configuration for running the greeter on Hyprland"
arch=('any')
url="https://github.com/HyDE-Project/sddm-hyprland"
license=('GPL-3.0-or-later')
depends=(
	'sddm'
	'hyprland'
	'layer-shell-qt5'
	'jq'
)
makedepends=('git')
source=("sddm-hyprland::git+https://github.com/HyDE-Project/sddm-hyprland.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/sddm-hyprland" || return 1
	printf "0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}/sddm-hyprland" || return 1

	install -Dm644 src/hyprland.conf "${pkgdir}/usr/share/hypr/sddm/hyprland.conf"
	install -Dm644 src/hyprprefs.conf "${pkgdir}/usr/share/hypr/sddm/hyprprefs.conf"

	# Optional override location referenced by the shipped hyprland.conf.
	install -Dm644 src/hyprland.conf "${pkgdir}/etc/sddm.conf.d/hypr/hyprland.conf"

	install -Dm644 src/sddm-hyprland.conf "${pkgdir}/etc/sddm.conf.d/sddm-hyprland.conf"
	install -Dm644 src/sddm-user.conf "${pkgdir}/etc/sddm.conf.d/sddm-user.conf"

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

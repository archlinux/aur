# Maintainer: bendn <bend.n@outlook.com>
# shellcheck disable=SC2148,SC2034

pkgname="godot2d"
pkgver='4.0.2.stable'
_pkgver_full='4.0.2'
pkgrel=2
pkgdesc="Godot Game Engine: An advanced, feature packed, multi-platform 2D game engine."
arch=('any')
url="https://github.com/bend-n/godot-builds"
license=('MIT')
depends=(glu libxcursor libxinerama alsa-lib freetype2 mesa)
conflicts=('godot-headless-export-templates-bin')
makedepends=()
_base_src_link="https://github.com/bend-n/godot-builds/releases/download/${_pkgver_full}/godot-2d_v${_pkgver_full}"
source=(
	LICENSE
	godot2d.desktop
	icon.png
	"${_base_src_link}_export_templates.tpz"
	"${_base_src_link}_linux.x86_64"
)
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')
provides=(godot2d godot2d-export-templates)
groups=(godot)
_repo="github.com/bend-n/godot-builds"

#pkgver() {
#	chmod +755 "godot-2d_v${_pkgver_full}_linux.x86_64"
#	./"godot-2d_v${_pkgver_full}_linux.x86_64" --version | rev | cut -d. -f1 | rev
#}

package() {
	install -Dm755 "godot-2d_v${_ver_tag}_linux.x86_64" "$pkgdir/usr/bin/godot2d"
	install -Dm644 "$srcdir/godot2d.desktop" "$pkgdir/usr/share/applications/godot2d.desktop"
	install -Dm644 "$srcdir/icon.png" "${pkgdir}/usr/share/pixmaps/godot2d.png"
	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	rm LICENSE icon.png godot2d.desktop ./"godot-2d_v${_pkgver_full}_"*
	mkdir -p "$pkgdir/usr/share/godot/export_templates/${pkgver}"
	cp ./* "$pkgdir/usr/share/godot/export_templates/${pkgver}"
	echo "templates in /usr/share/godot/export_templates/${pkgver}, please link to ~/.local/share/godot/export_templates/${pkgver}"
}

# Maintainer: bendn <bend.n@outlook.com>
# shellcheck disable=SC2148,SC2034

pkgname="godot2d"
pkgver='3.5.stable'
_ver_tag=$(echo "$pkgver" | awk -F'.' '{print $1"."$2}') # 3.5
pkgrel=1
pkgdesc="godot builds without all the 3d stuff."
arch=('any')
url="https://github.com/bend-n/godot-builds"
license=('MIT')
depends=(glu libxcursor libxinerama alsa-lib freetype2 mesa)
conflicts=('godot-headless-export-templates-bin')
makedepends=()
_base_src_link="https://github.com/bend-n/godot-builds/releases/download/${_ver_tag}/godot-2d_v${_ver_tag}_"
source=(
	LICENSE
	godot2d.desktop
	icon.png
	"${_base_src_link}export_templates.tpz"
	"${_base_src_link}x11.64"
)
sha256sums=(
	578ba76e15ac2ff313053114aba2466a18efe84fcfa2c3e54b5f464800c351fd
	6f5c46428db45000a9eda0444cc8e90065b455f96689a63b218de0d536949d3e
	495d4af9191c9d35655770856b603c04f27597d74bcaac6b5bb622d36e8ab566
	6c3050a936cac538171961422a8e614c8fe85c2bbbf280ed4059e00453b25c33
	7a2ccede0e0e9484923cca22f888177d8fcfa5c287411aa5199dfb2e4d09be00
)
provides=(godot2d godot2d-export-templates)
groups=(godot)
_repo="github.com/bend-n/godot-builds"

check() {
	chmod +755 "godot-2d_v${_ver_tag}_x11.64"
	./"godot-2d_v${_ver_tag}_x11.64" --no-window -e -q
}

package() {
	install -Dm755 "godot-2d_v${_ver_tag}_x11.64" "$pkgdir/usr/bin/godot2d"
	install -Dm644 "$srcdir/godot2d.desktop" "$pkgdir/usr/share/applications/godot2d.desktop"
	install -Dm644 "$srcdir/icon.png" "${pkgdir}/usr/share/pixmaps/godot2d.png"
	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	rm LICENSE icon.png godot2d.desktop ./"godot-2d_v${_ver_tag}_"*
	mkdir -p "$pkgdir/usr/share/godot/templates/${pkgver}"
	cp ./* "$pkgdir/usr/share/godot/templates/${pkgver}"
}

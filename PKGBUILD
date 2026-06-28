# Maintainer: Drake Strickland <drake.o.strickland at gmail dot com>

pkgname=bm64recomp-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Static recompilation of Bomberman 64"
arch=("x86_64" "aarch64")
url="https://github.com/RevoSucks/BM64Recomp"
license=('GPL-3.0')

depends=(
	"at-spi2-core"
	"cairo"
	"freetype2"
	"gdk-pixbuf2"
	"glib2"
	"gtk3"
	"harfbuzz"
	"libatomic"
	"libice"
	"libsm"
	"libx11"
	"libxext"
	"libxrandr"
	"pango"
	"sdl2-compat"
)

source_x86_64=(BM64Recompiled-v${pkgver}.zip::${url}/releases/download/v${pkgver}/BM64Recompiled-Linux-X64-Release.zip)
sha256sums_x86_64=(0a8f1889295ca0e06802e37317862e1552e98f09022c111b145396f36ae20bba)

source_aarch64=(BM64Recompiled-v${pkgver}.zip::${url}/releases/download/v${pkgver}/BM64Recompiled-Linux-ARM64-Release.zip)
sha256sums_aarch64=(63864cd71f9371eb5cf6a1cae4f49b821f046a59f29b82c6a8f8e57fbf1030ed)

source=(
	"https://raw.githubusercontent.com/RevoSucks/BM64Recomp/refs/heads/master/LICENSE.txt"
	"https://raw.githubusercontent.com/RevoSucks/BM64Recomp/v${pkgver}/icons/512.png"
	"${pkgname}.desktop"
	"bm64recompiled" # A wrapper script
)

sha256sums=(
	"3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986"
	"7f71d795091575e8fdedb77c56f775eda76a34e465e3912bb5aaac8504854e3e"
	"7083853b6d349523f125eb712eb05643aa7a6bc5afd7d3510ed405e30c58a53f"
	"00de3edc306a346ab3ac897f3e2a81555e1189aed6059ba130161f2207510e2a"
)

prepare() {
	bsdtar -xf BM64Recompiled-v${pkgver}.zip
	tar -xf "$srcdir/BM64Recompiled.tar.gz"
}

package() {
	install -Dm755 "BM64Recompiled" "$pkgdir/opt/${pkgname}/BM64Recompiled"
	install -Dm644 "recompcontrollerdb.txt" "$pkgdir/opt/${pkgname}/recompcontrollerdb.txt"
	cp -a "assets" "$pkgdir/opt/${pkgname}/"
	install -Dm644 "512.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"
	install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"

	# Install .desktop file
	install -Dm644 "${pkgname}.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"

	# Install wrapper script to allow running from terminal using 'bm64recompiled'
	install -Dm755 "bm64recompiled" "$pkgdir/usr/bin/bm64recompiled"
}

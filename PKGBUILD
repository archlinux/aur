# Maintainer: Christopher Schnick <crschnick@xpipe.io>

_fullver="25.0-5"
pkgname="xpipe-ptb"
pkgver="25.0"
pkgrel="5"
epoch=1
pkgdesc="XPipe Public Test Build releases"
arch=('x86_64' 'aarch64')
url="https://github.com/xpipe-io/${pkgname}"
license=('custom')
groups=()
# From https://aur.archlinux.org/packages/java-openjfx
depends=(
  cairo
  freetype2
  gdk-pixbuf2
  glib2
  gperf
  gtk3
  libgl
  libx11
  libxtst
  pango
  util-linux
  socat
  hicolor-icon-theme
)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=("xpipe-bin")
replaces=()
backup=()
options=(!debug !strip)
install=
changelog="${pkgname}.changelog"
source=("xpipe-ptb.desktop" "logo_16x16.png" "logo_22x22.png" "logo_32x32.png" "logo_44x44.png" "logo_48x48.png" "logo_64x64.png" "logo_128x128.png" "logo_256x256.png")
source_x86_64=(
  "${pkgname}-${_fullver}-x86_64.tar.gz::https://github.com/xpipe-io/${pkgname}/releases/download/${_fullver}/xpipe-portable-linux-x86_64.tar.gz"
  "${pkgname}-${_fullver}-x86_64.tar.gz.asc::https://github.com/xpipe-io/${pkgname}/releases/download/${_fullver}/xpipe-portable-linux-x86_64.tar.gz.asc"
)
source_aarch64=(
  "${pkgname}-${_fullver}-arm64.tar.gz::https://github.com/xpipe-io/${pkgname}/releases/download/${_fullver}/xpipe-portable-linux-arm64.tar.gz"
  "${pkgname}-${_fullver}-arm64.tar.gz.asc::https://github.com/xpipe-io/${pkgname}/releases/download/${_fullver}/xpipe-portable-linux-arm64.tar.gz.asc"
)
noextract=()
sha256sums=("6BD784DCCBF59E9BCE4A3DA55D52C00EEC8D55DDA8FB90CD46BBF366CF5E7654" "82EA59DBA089294E07E517DB0245068A32A7BD35C32CA01695579ACEED4FD76D" "BC600218320DB63A39E83CDC78C4FF7804D276FB6D229ED439216A0A189A14EC" "0DE9BE4A26539490D0B2799649134F916ED0AD9652B1852FACC900BB963A60B5" "05E478040342C3326223854C658A370E9C3D4A1822A29837EDAB1C1BA7EA59E8" "3DBAE16D777F7AD7761252B1F429278333A1117A70632F4025DE713E5B0A86C8" "ADFFF3878F4AC1857A7004F46715FD746BF8DACE2536F0DDCAAEECF441ABD235" "1687E388806A782CA790C3C87D94E51B4513E96AB77CBD1217A0A6D94D4C0E74" "BCD42E2497807AE0069A4CCCAFEDC5B993EB24EB844C9BF0AE26ABABCEEAE348")
sha256sums_x86_64=("244f7900deaf642ce6f6be88e4cf2a580f77b8ea585eba32078e157904031587" "56cb6a87b5fde0905bae20fef4f6a1d7ba667311fde55e0936aa0a6e371930bf")
sha256sums_aarch64=("244f7900deaf642ce6f6be88e4cf2a580f77b8ea585eba32078e157904031587" "56cb6a87b5fde0905bae20fef4f6a1d7ba667311fde55e0936aa0a6e371930bf")
validpgpkeys=("562E5DB9A14497782C008834BBDA885ADD3E0AD0")

package() {
	install -dm0755 "$pkgdir/opt"
	cp -a "$srcdir/xpipe-${_fullver}" "$pkgdir/opt/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/applications/" "$srcdir/${pkgname}.desktop"

    for logoFile in $srcdir/*.png; do
        res=$(basename "$logoFile" ".png" | cut -d "_" -f 2)
        install -Dm0644 "$logoFile" "$pkgdir/usr/share/icons/hicolor/$res/apps/${pkgname}.png"
    done

	install -d "$pkgdir/usr/bin"
	ln -s "/opt/$pkgname/bin/xpipe" "$pkgdir/usr/bin/${pkgname}"
	touch "$pkgdir/opt/$pkgname/aur"
}

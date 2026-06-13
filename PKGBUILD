# Maintainer: Christopher Schnick <crschnick@xpipe.io>

_fullver="23.5-6"
pkgname="xpipe-ptb"
pkgver="23.5"
pkgrel="6"
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
  "${pkgname}-${_fullver}-x86_64.tar.gz::https://github.com/xpipe-io/${pkgname}/releases/download/${_fullver}/xpipe-portable-linux-x86_64.tar.gz.asc"
)
source_aarch64=(
  "${pkgname}-${_fullver}-arm64.tar.gz::https://github.com/xpipe-io/${pkgname}/releases/download/${_fullver}/xpipe-portable-linux-arm64.tar.gz"
  "${pkgname}-${_fullver}-arm64.tar.gz::https://github.com/xpipe-io/${pkgname}/releases/download/${_fullver}/xpipe-portable-linux-arm64.tar.gz.asc"
)
noextract=()
sha256sums=("F7E26C2EBA1EC2AF909357475D3C3C6C55D1CF9E2BD7129276B89306298FBF9F" "82EA59DBA089294E07E517DB0245068A32A7BD35C32CA01695579ACEED4FD76D" "BC600218320DB63A39E83CDC78C4FF7804D276FB6D229ED439216A0A189A14EC" "0DE9BE4A26539490D0B2799649134F916ED0AD9652B1852FACC900BB963A60B5" "05E478040342C3326223854C658A370E9C3D4A1822A29837EDAB1C1BA7EA59E8" "3DBAE16D777F7AD7761252B1F429278333A1117A70632F4025DE713E5B0A86C8" "ADFFF3878F4AC1857A7004F46715FD746BF8DACE2536F0DDCAAEECF441ABD235" "1687E388806A782CA790C3C87D94E51B4513E96AB77CBD1217A0A6D94D4C0E74" "BCD42E2497807AE0069A4CCCAFEDC5B993EB24EB844C9BF0AE26ABABCEEAE348")
sha256sums_x86_64=("5f4c500debd5725800c9b708cc97038b361b85a7bcc8bba7dfe654c6bec227d7" "SKIP")
sha256sums_aarch64=("5f4c500debd5725800c9b708cc97038b361b85a7bcc8bba7dfe654c6bec227d7" "SKIP")
validpgpkeys=("562E5DB9A14497782C008834BBDA885ADD3E0AD0")

package() {
	install -dm0755 "$pkgdir/opt"
	cp -a "$srcdir/xpipe-${_fullver}" "$pkgdir/opt/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/applications/" "$srcdir/${pkgname}.desktop"

    for logoFile in $srcdir/*.png; do
        res=$(basename "$logoFile" ".png" | cut -d "_" -f 2)
        install -d "$pkgdir/usr/share/icons/hicolor/$res/apps"
        cp -a "$logoFile" "$pkgdir/usr/share/icons/hicolor/$res/apps/${pkgname}.png"
    done

	install -d "$pkgdir/usr/bin"
	ln -s "/opt/$pkgname/bin/xpipe" "$pkgdir/usr/bin/${pkgname}"
	touch "$pkgdir/opt/$pkgname/aur"
}

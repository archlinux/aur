# Maintainer: Christopher Schnick <crschnick@xpipe.io>

_fullver="21.5.1-1"
pkgname="xpipe-ptb"
pkgver="21.5.1"
pkgrel="1"
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
source=("xpipe-ptb.desktop" "logo_16x16.png" "logo_32x32.png" "logo_48x48.png" "logo_64x64.png" "logo_128x128.png" "logo_256x256.png")
source_x86_64=("${pkgname}-${_fullver}-x86_64.tar.gz::https://github.com/xpipe-io/${pkgname}/releases/download/${_fullver}/xpipe-portable-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${_fullver}-arm64.tar.gz::https://github.com/xpipe-io/${pkgname}/releases/download/${_fullver}/xpipe-portable-linux-arm64.tar.gz")
noextract=()
sha256sums=("F7E26C2EBA1EC2AF909357475D3C3C6C55D1CF9E2BD7129276B89306298FBF9F" "82EA59DBA089294E07E517DB0245068A32A7BD35C32CA01695579ACEED4FD76D" "0DE9BE4A26539490D0B2799649134F916ED0AD9652B1852FACC900BB963A60B5" "3DBAE16D777F7AD7761252B1F429278333A1117A70632F4025DE713E5B0A86C8" "ADFFF3878F4AC1857A7004F46715FD746BF8DACE2536F0DDCAAEECF441ABD235" "1687E388806A782CA790C3C87D94E51B4513E96AB77CBD1217A0A6D94D4C0E74" "BCD42E2497807AE0069A4CCCAFEDC5B993EB24EB844C9BF0AE26ABABCEEAE348")
sha256sums_x86_64=("c7813a4de73d6809fc6106b6f59fc1ef201a68fb4b802a6b68a107b7980769fe")
sha256sums_aarch64=("c7813a4de73d6809fc6106b6f59fc1ef201a68fb4b802a6b68a107b7980769fe")

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

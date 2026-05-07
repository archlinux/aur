# Maintainer: Christopher Schnick <crschnick@xpipe.io>

pkgname="pdx-unlimiter"
pkgver="3.5.2"
pkgrel="1"
epoch=1
pkgdesc="A smart savegame manager, editor, and toolbox for all current major Paradox Grand Strategy games."
arch=('x86_64')
url="https://github.com/crschnick/pdx_unlimiter"
license=('GPL3')
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
  hicolor-icon-theme
)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!debug !strip)
install=
changelog=
source=("Pdx-Unlimiter.desktop" "logo_16x16.png" "logo_32x32.png" "logo_48x48.png" "logo_64x64.png" "logo_128x128.png" "logo_256x256.png" "logo_512x512.png" "logo_1024x1024.png")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/crschnick/pdx_unlimiter/releases/download/${pkgver}/pdx-unlimiter-portable-linux-x86_64.tar.gz")
noextract=()
sha256sums=("5F4BFC2C9D6632DE08E5CCBA0F50D58997359D0B1EAC316ADD1897B366C3BB95" "CA8454DEB9D840696E85C02AED2D2CFDFEC5299E5A59298D0234701EC5E0A4EB" "13CD1CFD95BEE112154811DACE295DEAF98E6AB1647E8E1A5CFD054407D8C99F" "B78A91AB05911F3C7E616B0E12A712F46A53398536E8728241B861BC640F9E74" "E7670619C6BCFA86659EE2D8BE743056CBCBDF849AF5656974CA68B9B7AD4F23" "7857436E87ABDA68BF70CFC32DF8AAE74AB8BC141739F531B878034FA8AE9C57" "6E9A5023E22BB9763829D9C0974B9650D68DD613E1A786C59888CA2FB4E8CEEB" "911EA17F6F399622D25C7E14D43B022C7232CC1A8931CD1EE384960323939D3D" "8ED96FF0EA5AA2C3E2254DC9C1F91E60B3F41E82A575571ABC626008FD8E4A34")
sha256sums_x86_64=("335325c5ffc0bb5be5ca3fab5d1e8432d14391b191f05c660e7ca3c5ef66a5c7")

package() {
	install -dm0755 "$pkgdir/opt"
	cp -a "$srcdir/pdx-unlimiter-${pkgver}" "$pkgdir/opt/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/applications/" "$srcdir/Pdx-Unlimiter.desktop"

    for logoFile in $srcdir/*.png; do
        res=$(basename "$logoFile" ".png" | cut -d "_" -f 2)
        install -d "$pkgdir/usr/share/icons/hicolor/$res/apps"
        cp -a "$logoFile" "$pkgdir/usr/share/icons/hicolor/$res/apps/${pkgname}.png"
    done

	touch "$pkgdir/opt/$pkgname/aur"
}

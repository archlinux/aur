# Maintainer: Christopher Schnick <crschnick@xpipe.io>

_fullver="19.0-2"
pkgname="xpipe-ptb"
pkgver="19.0"
pkgrel="2"
epoch=1
pkgdesc="XPipe (Public Test Build) releases"
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
source=("logo_48x48.png" "logo_256x256.png" "${pkgname}.desktop")
source_x86_64=("${pkgname}-${_fullver}-x86_64.tar.gz::https://github.com/xpipe-io/${pkgname}/releases/download/${_fullver}/xpipe-portable-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${_fullver}-arm64.tar.gz::https://github.com/xpipe-io/${pkgname}/releases/download/${_fullver}/xpipe-portable-linux-arm64.tar.gz")
noextract=()
sha256sums=("3DBAE16D777F7AD7761252B1F429278333A1117A70632F4025DE713E5B0A86C8" "BCD42E2497807AE0069A4CCCAFEDC5B993EB24EB844C9BF0AE26ABABCEEAE348" "0D2B6270ADF42DB0DE37FDE1FCF69E77596A057E6CE7CAC005FEAF7461FAAC5A")
sha256sums_x86_64=("af167f949c517d88267277bb3e28fa51055da0700e36434d0ab2c5763d2a54b5")
sha256sums_aarch64=("af167f949c517d88267277bb3e28fa51055da0700e36434d0ab2c5763d2a54b5")

package() {
	install -dm0755 "$pkgdir/opt"
	cp -a "$srcdir/xpipe-${_fullver}" "$pkgdir/opt/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/applications/" "$srcdir/${pkgname}.desktop"
	install -d "$pkgdir/usr/share/icons/hicolor/48x48/apps"
	cp -a "$srcdir/logo_48x48.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/${pkgname}.png"
	install -d "$pkgdir/usr/share/icons/hicolor/256x256/apps"
	cp -a "$srcdir/logo_256x256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
	install -d "$pkgdir/usr/bin"
	ln -s "/opt/$pkgname/bin/xpipe" "$pkgdir/usr/bin/${pkgname}"
	touch "$pkgdir/opt/$pkgname/aur"
}

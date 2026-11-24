# Maintainer: BNDays27 <brionical@proton.me>
_pkgname=shadowrecomp
pkgname=$_pkgname-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="An unofficial PC port of the Xbox version of Shadow the Hedgehog, created through the process of static recompilation."
arch=(x86_64)
url="https://github.com/FoxWorkshop/ShadowRecomp"
license=('GPL')
depends=(
"systemd-libs"
"libx11"
"zlib"
"libxcb"
)
optdepends=(
  "wayland: Wayland support"
)
provides=('shadowrecomp')
conflicts=('shadowrecomp')
install=shadowrecomp.install
source=("$_pkgname-$pkgver.tar.gz::$url/releases/download/v${pkgver}/ShadowRecomp-Linux-x86_64-v${pkgver}.tar.gz"
	"https://raw.githubusercontent.com/FoxWorkshop/ShadowRecomp/refs/heads/master/flatpak/io.github.foxworkshop.shadowrecomp.desktop"
	"https://raw.githubusercontent.com/FoxWorkshop/ShadowRecompResources/refs/heads/master/images/game_icon.png"
	${_pkgname})
sha256sums=("0f7d08392b8be32b7040ec77c3335cf73be4f43caa5c8fa04e2707c1c5a31322"
	    "SKIP"
	    "SKIP"
	    "SKIP")

package() {
	cd $srcdir
	sed -i "s|/app/bin/ShadowRecomp|/opt/ShadowRecomp/ShadowRecomp|" "$srcdir/io.github.foxworkshop.shadowrecomp.desktop"
	install -Dm644 "$srcdir/io.github.foxworkshop.shadowrecomp.desktop" "$pkgdir/usr/share/applications/io.github.foxworkshop.shadowrecomp.desktop"
	install -Dm755 "$srcdir/ShadowRecomp" "$pkgdir/opt/ShadowRecomp/ShadowRecomp"
	install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm755 "$srcdir/libdxcompiler.so" "$pkgdir/opt/ShadowRecomp/libdxcompiler.so"
	install -Dm644 "$srcdir/game_icon.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/io.github.foxworkshop.shadowrecomp.png"
}

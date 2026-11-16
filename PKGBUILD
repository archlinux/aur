# Maintainer: BNDays27 <brionical@proton.me>
_pkgname=shadowrecomp
pkgname=$_pkgname-bin
pkgver=1.0.0
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
sha256sums=("8a1466c9636703deeb1976e6ca4ebe807813cbf8ebd7b336bf5067313850c3a4"
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

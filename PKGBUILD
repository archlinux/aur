# Maintainer: Zitro <com dot proton mail at u4595650016>

# Special thanks: tinywrkb <com dot gmail at tinywrkb>

pkgname=pipewire-jack-replacement
pkgdesc="Use pipewire-jack as replacement for JACK (building headers + pkgconfig)"
pkgver=1.9.19
pkgrel=2
makedepends=("git" "coreutils" "findutils")
depends=("pipewire-jack" "pipewire-jack-dropin")
provides=("jack" "libjacknet.so=0-64" "libjackserver.so=0-64" "libjack.so=0-64")

url="https://github.com/jackaudio/headers/"
source=("git+https://github.com/jackaudio/headers/" "pipewire-jack.pc")
sha256sums=("SKIP" "b6688919c6119051435f4d50658a2b988ff49241583c09a776f604a24f6c2407")

license=("GPL2")
arch=(any)

package() {
	install -Dm644 "$srcdir/pipewire-jack.pc" -t "$pkgdir/usr/lib/pkgconfig"
	ln -s "./pipewire-jack.pc" "$pkgdir/usr/lib/pkgconfig/jack.pc"

	install -dm755 "$pkgdir/usr/include/jack"
	find "$srcdir/headers" -type f ! -ipath "*.git*" -exec install -Dm644 "{}" "$pkgdir/usr/include/jack/" \;
}

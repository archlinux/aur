# Maintainer: wommel <aur at impium dot de>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=telerising-api-bin
pkgver=0.11.6
pkgrel=1
pkgdesc='API web application providing Zattoo TV streams'
arch=('x86_64')
license=('custom')
url='https://github.com/sunsettrack4/telerising-api'
options=(!strip)
source=(
	"https://github.com/sunsettrack4/telerising-api/raw/main/telerising-v${pkgver}_x86-64_linux.zip"
	"$pkgname.service"
	startup.sh
)
sha512sums=(
	ac8914983c66ee9ceaf500ad759f6bab6f14b79f50fb9a5369e0cb9ae92f2613d83c8394bd96cb530be42fec0eceb22f03eef7834f2ea73bf5674ba91c0b0d58 # telerising-v${pkgver}_x86-64_linux.zip
	21dbbb489ce95925cf475b7e259111666031fb27556f67e92042526a0d57df537bf6d0185c17da81e88c36934c49a1ac4d48717bf6ad0310927444868578a819 # telerising-api-bin.service
	8d50a8b56efc882f247af83714916abe9f1d2e87830614f38d01790c04f0c0a7c7192e72426d1f4b6c90edc9a705f9e86b5fe7d44543a5755ffdfda2d894d313 # startup.sh
)

package() {
	mkdir -p "$pkgdir/usr/lib/"
	mv "$srcdir/telerising/" "$pkgdir/usr/lib/$pkgname/"

	install -Dm0755 "$srcdir/startup.sh" "$pkgdir/usr/bin/$pkgname"
	install -Dm0644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
}

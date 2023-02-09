# Maintainer: wommel <aur at impium dot de>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=telerising-api-bin
pkgver=0.9.5
pkgrel=2
pkgdesc='API web application providing Zattoo TV streams'
arch=('x86_64')
license=('custom')
url='https://github.com/sunsettrack4/telerising-api'
source=(
	"https://github.com/sunsettrack4/telerising-api/raw/main/telerising-v${pkgver}_x86-64_linux.zip"
	"$pkgname.service"
	startup.sh
)
sha512sums=(
	0c99cbec92a3f377d53279e848a34d37ddcb35cdbf934ad430cf36547ebb40e4cdff36bdf7edad6db5ee8d4096f0560a871ed7685c744b9633a771cd46a35f2e # telerising-v${pkgver}_x86-64_linux.zip
	21dbbb489ce95925cf475b7e259111666031fb27556f67e92042526a0d57df537bf6d0185c17da81e88c36934c49a1ac4d48717bf6ad0310927444868578a819 # telerising-api-bin.service
	8d50a8b56efc882f247af83714916abe9f1d2e87830614f38d01790c04f0c0a7c7192e72426d1f4b6c90edc9a705f9e86b5fe7d44543a5755ffdfda2d894d313 # startup.sh
)

package() {
	mkdir -p "$pkgdir/usr/lib/"
	mv "$srcdir/telerising/" "$pkgdir/usr/lib/$pkgname/"

	install -Dm0755 "$srcdir/startup.sh" "$pkgdir/usr/bin/$pkgname"
	install -Dm0644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
}

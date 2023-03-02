# Maintainer: wommel <aur at impium dot de>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=telerising-api-bin
pkgver=0.9.7
pkgrel=1
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
	dd7c9543be9482c51fc0c3bd25dcbe67d2c21b3fc114324518381d4ea8b9cab2014a84cfef416121453814bbfefe9ca3454cacebb376ae7a5050f34c99e3c3f0 # telerising-v${pkgver}_x86-64_linux.zip
	21dbbb489ce95925cf475b7e259111666031fb27556f67e92042526a0d57df537bf6d0185c17da81e88c36934c49a1ac4d48717bf6ad0310927444868578a819 # telerising-api-bin.service
	8d50a8b56efc882f247af83714916abe9f1d2e87830614f38d01790c04f0c0a7c7192e72426d1f4b6c90edc9a705f9e86b5fe7d44543a5755ffdfda2d894d313 # startup.sh
)

package() {
	mkdir -p "$pkgdir/usr/lib/"
	mv "$srcdir/telerising/" "$pkgdir/usr/lib/$pkgname/"

	install -Dm0755 "$srcdir/startup.sh" "$pkgdir/usr/bin/$pkgname"
	install -Dm0644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
}

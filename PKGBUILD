# Maintainer: wommel <aur at impium dot de>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=telerising-api-bin
pkgver=0.9.1
pkgrel=1
pkgdesc='API web application providing Zattoo TV streams'
arch=('x86_64')
license=('custom')
url='https://github.com/sunsettrack4/telerising-api'
source=(
	"https://github.com/sunsettrack4/telerising-api/raw/main/telerising-v${pkgver}_x86-64_linux.zip"
	'telerising-api.service'
	'startup.sh'
)
sha512sums=(
	'65a6c49040bbbf85f0553213f00d001099cea63621faede704f266d978019de03a07fc9aa872d4c7f8468c1850391463462542e5a6c82fed47c1c5b74ff34566' # telerising-v${pkgver}_x86-64_linux.zip
	'c6a2c6d699d033bd53487093ea08c16eaf9e721af03246b883e5828704c44423eeca32473923466d30fd0223e9f15e51ed4e6bb938f731c2f6b4ceb2ade628aa' # telerising-api.service
	'8d50a8b56efc882f247af83714916abe9f1d2e87830614f38d01790c04f0c0a7c7192e72426d1f4b6c90edc9a705f9e86b5fe7d44543a5755ffdfda2d894d313' # startup.sh
)

package() {
	mkdir -p "$pkgdir/usr/lib/"
	mv "$srcdir/telerising/" "$pkgdir/usr/lib/$pkgname/"

	install -Dm0755 "$srcdir/startup.sh" "$pkgdir/usr/lib/$pkgname/startup.sh"
	install -Dm0644 "$srcdir/telerising-api.service" "$pkgdir/usr/lib/systemd/system/telerising-api.service"
}

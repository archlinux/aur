# Maintainer: Grant Moyer <grantmoyer@gmail.com>
# Co-Maintainer: Tomas S. <me+aur at wereii.cz>

pkgname=foundryvtt
pkgver=13.348
pkgrel=1
pkgdesc="A self-hosted, modern, and developer-friendly roleplaying platform"
arch=('x86_64')
url="https://foundryvtt.com/"
license=('custom')
# FoundryVTT archive must be downloaded from https://foundryvtt.com/community/<usename>/licenses
options=(!strip)
source=(
	"FoundryVTT-Linux-$pkgver.zip::local://FoundryVTT-Linux-$pkgver.zip"
	"foundryvtt.desktop"
)
sha256sums=(
    'd629ffaae0de8d47d3ae9114e13bfbe7c48206040772ad1391cb4808730674ff'
    'eb6d09ea176748a0e9b3a0ebb2aa3f2bca23e5f082ed676edd9fd8bf6b0ebbcb'
)

package() {
	install -m755 -d "$pkgdir/opt/$pkgname"
	install -m755 -d "$pkgdir/usr/bin"
	install -m644 -D -t "$pkgdir/usr/share/licenses/$pkgname/" "resources/app/license.html"
	install -m644 -D -t "$pkgdir/usr/share/applications/" "foundryvtt.desktop"
	cp -r * "$pkgdir/opt/$pkgname"
	rm "$pkgdir/opt/$pkgname/${source[0]/::*/}"
	ln -s "/opt/$pkgname/foundryvtt" "$pkgdir/usr/bin/foundryvtt"
}

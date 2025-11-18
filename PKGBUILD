# Maintainer: Wellinton Vieira <wellintonvieira.office@gmail.com>

pkgname="aurup"
pkgver="1.74"
pkgrel=1
pkgdesc="The simplify finding and installing packages AUR helper"
arch=("x86_64")
url="https://github.com/nellowint/$pkgname"
license=("GNU")
depends=("bash-completion" "curl" "jq" "tar")
makedepends=("git")
source=("git+https://github.com/nellowint/$pkgname.git")
md5sums=("SKIP")

package() {
	cd "$pkgname"
	install -Dm755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname.sh"
	sudo install -Dm755 "$pkgname-complete.sh" "/usr/share/bash-completion/completions/$pkgname-complete.sh"
	install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

	sed -i "/$pkgname/d" "/$HOME/.bashrc"

	echo -e "\n\nif [ -e /usr/bin/$pkgname.sh ]; then #$pkgname
	alias $pkgname='sh /usr/bin/$pkgname.sh' #$pkgname
	source /usr/share/bash-completion/completions/$pkgname-complete.sh #$pkgname
fi #$pkgname" >> "/$HOME/.bashrc"

	echo $(source "/$HOME/.bashrc")
}
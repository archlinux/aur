# Maintainer: Wellinton Vieira <wellintonvieira.office@gmail.com>

pkgname="update-mirrors"
pkgver="1.23"
pkgrel=1
pkgdesc="A simple command line (CLI) tool designed to simplify updating mirrors of Arch Linux-based systems."
arch=("x86_64")
url="https://github.com/nellowint/$pkgname"
license=("GNU")
depends=("bash-completion" "curl")
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
# Maintainer: MuntasirSZN <muntasir.joypurhat@gmail.com>
pkgname=getquotes-git
pkgver=r1.0
pkgrel=1
pkgdesc="A simple cli tool to get quotes in your terminal using WikiQuotes"
arch=('x86_64')
url="https://github.com/MuntasirSZN/getquotes"
license=('MIT')
depends=('cargo')
makedepends=('git' 'rust')
source=("git+https://github.com/MuntasirSZN/getquotes.git")
sha256sums=('SKIP')
conflicts=('getquotes')

pkgver() {
	cd "$srcdir/getquotes"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/getquotes"
	cargo build --release
}

package() {
	cd "$srcdir/getquotes"
	install -Dm755 target/release/getquotes "$pkgdir/usr/bin/getquotes"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "man/getquotes.1" "$pkgdir/usr/share/man/man1/getquotes.1"
	# Install bash completions
	install -Dm644 "completions/getquotes.bash" "${pkgdir}/usr/share/bash-completion/completions/getquotes"

	# Install zsh completions
	install -Dm644 "completions/_getquotes" "${pkgdir}/usr/share/zsh/site-functions/_getquotes"

	# Install fish completions
	install -Dm644 "completions/getquotes.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/getquotes.fish"

	# Install elvish completions
	install -Dm644 "completions/getquotes.elv" "${pkgdir}/usr/share/elvish/completions/getquotes.elv"

	# Install PowerShell completions
	install -Dm644 "completions/_getquotes.ps1" "${pkgdir}/usr/share/powershell/Modules/GetQuotes/_getquotes.ps1"
}

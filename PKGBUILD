# Maintainer: MuntasirSZN <muntasir.joypurhat@gmail.com>
pkgname=getquotes
pkgver=0.5.1
pkgrel=1
pkgdesc="A simple cli tool to get quotes in your terminal using WikiQuotes"
arch=('x86_64' 'aarch64')
url="https://github.com/MuntasirSZN/getquotes"
license=('MIT')
source_x86_64=("https://github.com/MuntasirSZN/getquotes/releases/download/v${pkgver}/getquotes-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/MuntasirSZN/getquotes/releases/download/v${pkgver}/getquotes-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('8acad70dae72664ebbd72bc437ed8932bfe0545b1044319043ffd0aaf922d791')
sha256sums_aarch64=('e758c4580d2f643061b41b11e821b9fd358b726324deecf08bf615d90a19523d')
conflicts=('getquotes-git')

package() {
	cd "$srcdir"

	# Extract the appropriate tar.gz file based on architecture
	if [[ "$CARCH" == "x86_64" ]]; then
		tar -xzf getquotes-x86_64-unknown-linux-gnu.tar.gz
	else
		tar -xzf getquotes-aarch64-unknown-linux-gnu.tar.gz
	fi

	# Install the binary
	install -Dm755 getquotes "$pkgdir/usr/bin/getquotes"
	# Install the LICENSE file
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	# Install the manpage
	install -Dm644 man/getquotes.1 "$pkgdir/usr/share/man/man1/getquotes.1"

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

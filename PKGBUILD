# Maintainer: Zhanibek Adilbekov <zhnaibek.adilbekov@proton.me>
# shellcheck disable=2034,2154,2164
pkgname=gibo-bin
pkgver=3.0.12
pkgrel=1
pkgdesc='Command-line tool to help you easily access .gitignore boilerplates'
arch=('x86_64')
url="https://github.com/simonwhitaker/gibo"
license=('custom:UNLICENSE')
install=gibo.install
source=(
		"https://github.com/simonwhitaker/gibo/releases/download/v${pkgver}/gibo_Linux_x86_64.tar.gz"
		"gibo.install"
	   )
b2sums=('da347389867d9f870e31f12869389d32c0589d59c9ab700dfdf9b2cf855757364a17857c3d40fde64d02a772fbe5997671ebcd9d8564145355a987d9f911385c'
        'a8516b43198e9353eaf0fe49d50cb50ea2ac096b0366deabd33795b2c6d52ede6264d5615acdf78117550dbd2dc13999bca66fc9d1b10a090e7cee344c487f97')

build() {
	"$srcdir/gibo" completion bash >"$srcdir/gibo-completion.bash"
	"$srcdir/gibo" completion zsh  >"$srcdir/gibo-completion.zsh"
	"$srcdir/gibo" completion fish >"$srcdir/gibo.fish"
}

package() {
    install -Dm755 "$srcdir/gibo" "$pkgdir/usr/bin/gibo"

    # license
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # bash
    mkdir -p "$pkgdir/usr/share/bash-completion"
    install -Dm644 "$srcdir/gibo-completion.bash" "$pkgdir/usr/share/bash-completion/completions/gibo"

    # zsh
    mkdir -p "$pkgdir/usr/share/zsh/site-functions"
    install -Dm644 "$srcdir/gibo-completion.zsh" "$pkgdir/usr/share/zsh/site-functions/_gibo"

    # fish
    mkdir -p "$pkgdir/usr/share/fish/vendor_completions.d"
    install -Dm644 "$srcdir/gibo.fish" "$pkgdir/usr/share/fish/vendor_completions.d/gibo.fish"
}

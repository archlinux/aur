# Maintainer: ZXY595 <zxy_595@qq.com>
_pkgname=clashtui
pkgname=$_pkgname-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="Mihomo (Clash.Meta) TUI Client"
arch=('x86_64')
url="https://github.com/JohanChane/clashtui"
license=('MIT')
depends=("mihomo" "sudo" "fzf")
optdepends=()
conflicts=("$_pkgname")
install="post.install"
program_name="$_pkgname-linux-amd64-v$pkgver"
source=(
	"$url/releases/download/v$pkgver/$program_name.gz"
	"config.yaml"
)
sha256sums=('4d4cf18563794ed9e0220bb843f5ca0ee3d81b008dd4d9cd2dff65082fa4735b'
            '3773ffa48b79886c33e7b9ad302f3e3efe6181b3aa3de1596afaee65d8b96958')

package() {
	chmod +x $program_name # for generate shell completion

	"$srcdir/$program_name" --generate-shell-completion=bash > "bash-completion"
	install -Dm 644 "bash-completion" "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
	"$srcdir/$program_name" --generate-shell-completion=fish > "fish-completion"
	install -Dm 644 "fish-completion" "$pkgdir/usr/share/fish/vendor_completions.d/$_pkgname.fish"
	"$srcdir/$program_name" --generate-shell-completion=zsh > "zsh-completion"
	install -Dm 644 "zsh-completion" "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"

	install -Dm 755 "$program_name" "$pkgdir/usr/bin/$_pkgname"
	install -Dm 644 "config.yaml" -t "$pkgdir/usr/share/$_pkgname/"
}


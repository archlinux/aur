# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=hugo-bin
_pkgname="${pkgname%-bin}"
pkgver=0.88.1
pkgrel=1
pkgdesc='Fast and flexible static site generator written in Go'
arch=('x86_64')
url='https://gohugo.io'
license=('Apache')
optdepends=(
	'asciidoctor: AsciiDoc support'
	'bash-completion: Tab autocompletion'
	'git: Git info variables'
	'pandoc: Pandoc support'
	'python-docutils: reStructuredText support'
)
provides=("$_pkgname")
conflicts=(
	"$_pkgname"
	"$_pkgname-git"
)
source=("https://github.com/gohugoio/$_pkgname/releases/download/v$pkgver/${_pkgname}_extended_${pkgver}_Linux-64bit.tar.gz")
b2sums=(3c139dc02fc5e68ff4309d7f7c70ac89d4a62be225aeabfb218b3c63e527b23e887c5088cb6d7c7cdc97833304d5929d56355a250c269c95eb25a6bfc22d816e)

package() {
	install -Dm 755 "$_pkgname" -t "$pkgdir/usr/bin"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
	"$pkgdir/usr/bin/$_pkgname" gen autocomplete bash | install -Dm 644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
	"$pkgdir/usr/bin/$_pkgname" gen autocomplete zsh | install -Dm 644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
}

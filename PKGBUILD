# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=hugo-bin
_pkgname="${pkgname%-bin}"
pkgver=0.88.0
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
b2sums=(8ad773a3953b2e1950cc9ada37021ad06149c3ed37819c09e5060564f7ad9e4f447201c4267e16b2b20e9d5049c7c447ba5e69d37d9ff30b3368b96179d3a13c)

package() {
	install -Dm 755 "$_pkgname" -t "$pkgdir/usr/bin"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
	"$pkgdir/usr/bin/$_pkgname" gen autocomplete bash | install -Dm 644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
	"$pkgdir/usr/bin/$_pkgname" gen autocomplete zsh | install -Dm 644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
}

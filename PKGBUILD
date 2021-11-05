# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=hugo-bin
_pkgname="${pkgname%-bin}"
pkgver=0.89.1
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
b2sums=(5ac5b07acbbc0c4d5c726fe5ace69b2833c660241d73b6abf4b1f493dbd1a59289271243d119ca7ef2923445538b5e0aab9e57006727f9f1c938d1a0a2eb1816)

package() {
	install -Dm 755 "$_pkgname" -t "$pkgdir/usr/bin"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
	"$pkgdir/usr/bin/$_pkgname" gen autocomplete bash | install -Dm 644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
	"$pkgdir/usr/bin/$_pkgname" gen autocomplete zsh | install -Dm 644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
}

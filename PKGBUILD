# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=hugo-bin
_pkgname="${pkgname%-bin}"
pkgver=0.87.0
pkgrel=1
pkgdesc='Fast and flexible static site generator written in Go'
arch=('x86_64')
_goos='linux'
_goarch='amd64'
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
b2sums=(af2729b4869534502e87b0a7a27195b92aba37ce84238467666587660df47351ef84f9d8aceb7e0630d28ee441c87bf2255c97b5e68410e3aabef1c7cd60278b)

package() {
	install -Dm 755 "$_pkgname" -t "$pkgdir/usr/bin"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
	"$pkgdir/usr/bin/$_pkgname" gen autocomplete bash | install -Dm 644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
	"$pkgdir/usr/bin/$_pkgname" gen autocomplete zsh | install -Dm 644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
}

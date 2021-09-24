# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=ko-bin
_pkgname="${pkgname%-bin}"
pkgver=0.9.1
pkgrel=1
pkgdesc='Simple and fast container image builder for Go applications'
arch=('x86_64')
_goos='Linux'
url='https://github.com/google/ko'
license=('Apache')
depends=('go')
optdepends=(
	'bash-completion: for tab completion'
	'docker: for Docker authentication support'
	'kubectl: for Kubernetes support'
)
provides=("$_pkgname")
conflicts=(
	"$_pkgname"
	"$_pkgname-git"
)
source=("$url/releases/download/v$pkgver/${_pkgname}_${pkgver}_${_goos}_${arch}.tar.gz")
b2sums=(7383a6dd24fa478e2e42b33486305b76584576518fca2e16b5bb8fdaccdc5a5e2e105769f08cd519dc7505d36f91b8fe62f5ae15b81186b685c63c04b871a221)

package() {
	install -Dm 755 "$_pkgname" -t "$pkgdir/usr/bin"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
	"$pkgdir/usr/bin/$_pkgname" completion | install -Dm 644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
	"$pkgdir/usr/bin/$_pkgname" completion --zsh | install -Dm 644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
}

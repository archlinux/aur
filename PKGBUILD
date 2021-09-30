# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=ko-bin
_pkgname="${pkgname%-bin}"
pkgver=0.9.3
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
b2sums=(68cd94803ec9f8e6b4372f1cace10bfeaba38fdc8076fd74878cb1545dfe3a2720e0d08c60f0d1a7772197dc1466ac0ba3a981d048be47cd9cccde29c5af9fc1)

package() {
	install -Dm 755 "$_pkgname" -t "$pkgdir/usr/bin"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
	"$pkgdir/usr/bin/$_pkgname" completion | install -Dm 644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
	"$pkgdir/usr/bin/$_pkgname" completion --zsh | install -Dm 644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
}

# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=ko-bin
_pkgname="${pkgname%-bin}"
pkgver=0.9.2
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
b2sums=(3f40e944a83adf0eff37e5bf51755eeb9d9cb02f4120db0a8482b2e22474c5d816c01e95529010f512241396a7278d0e54dd212f912b8529353fdaad0ead25f3)

package() {
	install -Dm 755 "$_pkgname" -t "$pkgdir/usr/bin"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
	"$pkgdir/usr/bin/$_pkgname" completion | install -Dm 644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
	"$pkgdir/usr/bin/$_pkgname" completion --zsh | install -Dm 644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
}

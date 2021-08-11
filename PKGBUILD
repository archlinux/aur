# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=skaffold-bin
_pkgname="${pkgname%-bin}"
pkgver=1.30.0
pkgrel=1
pkgdesc='Command line tool that facilitates continuous development for Kubernetes applications'
arch=('x86_64')
_goos='linux'
_goarch='amd64'
url='https://skaffold.dev'
license=('Apache')
optdepends=('bash-completion: for tab completion')
provides=("$_pkgname")
conflicts=(
	"$_pkgname"
	"$_pkgname-git"
)
source=("$pkgname-$pkgver::https://storage.googleapis.com/$_pkgname/releases/v$pkgver/$_pkgname-$_goos-$_goarch")
b2sums=(7ac4b45ec93cbf4148de546d274610e9656b81411dc29aa2cc0d13354ade0cadd8320d3ffad02aa4eeb05a1c1547306b2082835f2d134bc7f6747c0b4ee91170)

package() {
	install -Dm 755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
	"$pkgdir/usr/bin/$_pkgname" completion bash | install -Dm 644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
	"$pkgdir/usr/bin/$_pkgname" completion zsh | install -Dm 644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
}

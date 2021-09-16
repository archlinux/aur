# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=skaffold-bin
_pkgname="${pkgname%-bin}"
pkgver=1.32.0
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
b2sums=(9db76b12ea9d920de6b1be0cd4a9231e9af98c965437007c2a959219ef50c18ff140a3d74cfcaa4e985a793705a5295ef4fe4175bdd96f7c46a4881463eb4ca6)

package() {
	install -Dm 755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
	"$pkgdir/usr/bin/$_pkgname" completion bash | install -Dm 644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
	"$pkgdir/usr/bin/$_pkgname" completion zsh | install -Dm 644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
}

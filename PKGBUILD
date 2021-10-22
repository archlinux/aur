# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=skaffold-bin
_pkgname="${pkgname%-bin}"
pkgver=1.33.1
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
b2sums=(ceab0cd2e5c2c96d796c2169dde00a1bd99d3d48c4d3dd00e36da06c744362e5d3a7595b966c9028686e5e260f89e5e1cf0425b1560fe94cd1cc3f5b97447ce1)

package() {
	install -Dm 755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
	"$pkgdir/usr/bin/$_pkgname" completion bash | install -Dm 644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
	"$pkgdir/usr/bin/$_pkgname" completion zsh | install -Dm 644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
}

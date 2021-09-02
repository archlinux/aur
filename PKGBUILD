# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=ko-bin
_pkgname="${pkgname%-bin}"
pkgver=0.8.3
pkgrel=1
pkgdesc='Simple and fast container image builder for Go applications'
arch=('x86_64')
_goos='Linux'
url='https://github.com/google/ko'
license=('Apache')
optdepends=('bash-completion: for tab completion')
provides=("$_pkgname")
conflicts=(
	"$_pkgname"
	"$_pkgname-git"
)
source=("$url/releases/download/v$pkgver/${_pkgname}_${pkgver}_${_goos}_${arch}.tar.gz")
b2sums=(b127d97447403ba6591d5cde395e0171ad2b240d023e73deca53ef6ceb92cf1d9891ee2bd5475c6e518de57be9477fe50f0a9aca93f649853576a573da1a5c81)

package() {
	install -Dm 755 "$_pkgname" -t "$pkgdir/usr/bin"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
	"$pkgdir/usr/bin/$_pkgname" completion | install -Dm 644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
	"$pkgdir/usr/bin/$_pkgname" completion --zsh | install -Dm 644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
}

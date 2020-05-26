# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>

pkgname=kubecfg
pkgver=0.16.0
pkgrel=1
pkgdesc="A tool for managing complex enterprise Kubernetes environments as code"
url="https://github.com/bitnami/kubecfg"
license=('Apache')
arch=('x86_64')
makedepends=('git' 'go')
source=("git+https://github.com/bitnami/kubecfg.git#tag=v${pkgver}")
md5sums=('SKIP')

prepare() {
	rm -rf "$srcdir/src"
	mkdir -p "$srcdir/src/github.com/bitnami/kubecfg"
	mv -T "$srcdir/kubecfg" "$srcdir/src/github.com/bitnami/kubecfg"
}

build() {
	export GOPATH="$srcdir"
	cd "$GOPATH/src/github.com/bitnami/kubecfg"
	make kubecfg
}

package() {
	install -Dm755 "$srcdir/src/github.com/bitnami/kubecfg/kubecfg" -t "$pkgdir/usr/bin"

	"$pkgdir/usr/bin/kubecfg" completion --shell bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/kubecfg"
	"$pkgdir/usr/bin/kubecfg" completion --shell zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_kubecfg"
}

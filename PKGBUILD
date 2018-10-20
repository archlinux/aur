# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>

pkgname=kubecfg
pkgver=0.9.0
pkgrel=1
pkgdesc="A tool for managing complex enterprise Kubernetes environments as code"
url="https://github.com/ksonnet/kubecfg"
license=('Apache')
arch=('x86_64')
makedepends=('git' 'go')
source=("git+https://github.com/ksonnet/kubecfg.git#tag=v${pkgver}")
md5sums=('SKIP')

prepare() {
	rm -rf "$srcdir/src"
	mkdir -p "$srcdir/src/github.com/ksonnet/kubecfg"
	mv -T "$srcdir/kubecfg" "$srcdir/src/github.com/ksonnet/kubecfg"
}

build() {
	export GOPATH="$srcdir"
	cd "$GOPATH/src/github.com/ksonnet/kubecfg"
	make kubecfg
}

package() {
	install -Dm755 "$srcdir/src/github.com/ksonnet/kubecfg/kubecfg" -t "$pkgdir/usr/bin"
}

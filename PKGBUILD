# Maintainer: Simon Weald <simon[at]simonweald[dot]com>
# Maintainer: Tomas Kral <tomas.kral@gmail.com>

pkgname=kompose-bin
_srcname=kompose
pkgver=1.24.0
pkgrel=1
pkgdesc="Takes a Docker Compose file and translates it into Kubernetes resources"
url="http://kompose.io/"
license=('Apache')
arch=('x86_64')
source_x86_64=("$_srcname-$pkgver.tar.gz::https://github.com/kubernetes/kompose/releases/download/v$pkgver/kompose-linux-amd64.tar.gz")
sha256sums_x86_64=('4e2f8710d66b175475aba0cae2a290bd93b6678b10191389728ddb05b75d4568')

package() {
	cd ${srcdir}
	tar -xzf $_srcname-$pkgver.tar.gz
	install -Dm755 "$srcdir/kompose-linux-amd64" "$pkgdir/usr/bin/kompose"

	install -dm 755 "$pkgdir/usr/share/bash-completion/completions"
	install -dm 755 "$pkgdir/usr/share/zsh/site-functions"
	"$pkgdir/usr/bin/kompose" completion bash > "$pkgdir/usr/share/bash-completion/completions/kompose"
	"$pkgdir/usr/bin/kompose" completion zsh >  "$pkgdir/usr/share/zsh/site-functions/_kompose"
}

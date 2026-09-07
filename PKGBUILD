# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=okd-client-bin
pkgver="5.0.0_okd_scos.ec.8"
pkgrel=1
pkgdesc="Client tools for OpenShift"
arch=(x86_64)
url="https://github.com/openshift/okd"
license=('Apache')

source=("https://github.com/openshift/okd/releases/download/${pkgver//_/-}/openshift-client-linux-${pkgver//_/-}.tar.gz")

sha256sums=('280da96034d9ab03226b951cd48cda99ed131725fc529e17a8b80a2dc39a8ca8')

prepare() {
	# generate completion
	$srcdir/oc completion bash >$srcdir/bash-completions
	$srcdir/oc completion zsh >$srcdir/zsh-completions
}

package() {
	# completions
	install -D -m644 $srcdir/bash-completions $pkgdir/usr/share/bash-completion/completions/oc
	install -D -m644 $srcdir/zsh-completions $pkgdir/usr/share/zsh/site-functions/_oc

	# package
	install -D -m755 $srcdir/oc $pkgdir/usr/bin/oc
}

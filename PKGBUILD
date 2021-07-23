# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=okd-client-bin
pkgver=4.7.0_0
pkgrel=2
pkgdesc="Client tools for OpenShift"
arch=(x86_64)
url="https://github.com/openshift/okd"
license=('Apache')

pkgdate="2021-07-03-190901"

source=("https://github.com/openshift/okd/releases/download/${pkgver//_/-}.okd-${pkgdate}/openshift-client-linux-${pkgver//_/-}.okd-${pkgdate}.tar.gz")

sha256sums=('32a3c7ad793c673fdfdbb5ecbc4ef03bfcfd4a59ce3ceef87b05c4b0d31dc5ff')

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

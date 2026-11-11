# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=okd-client-bin
pkgver="5.1.0_okd_scos.ec.3"
pkgrel=1
pkgdesc="Client tools for OpenShift"
arch=(x86_64)
url="https://github.com/okd-project/okd"
license=('Apache')

source=("https://github.com/okd-project/okd/releases/download/${pkgver//_/-}/openshift-client-linux-${pkgver//_/-}.tar.gz")

sha256sums=('964ccb9b6fbdeb9df590c8dd1ed7190e31af11c606f2a6b1ea4e86bf81ae568d')

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

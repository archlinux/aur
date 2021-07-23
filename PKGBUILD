# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=okd-client-bin
pkgver="4.7.0_0.okd_2021_07_03_190901"
pkgrel=1
pkgdesc="Client tools for OpenShift"
arch=(x86_64)
url="https://github.com/openshift/okd"
license=('Apache')

_pkgver=${pkgver%.*}
_pkgdate=${pkgver##*okd_}

source=("https://github.com/openshift/okd/releases/download/${_pkgver//_/-}.okd-${_pkgdate//_/-}/openshift-client-linux-${_pkgver//_/-}.okd-${_pkgdate//_/-}.tar.gz")

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

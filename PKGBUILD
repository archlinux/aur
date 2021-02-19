# Maintainer: Josh Gwosdz <jgwosdz at redhat dot com>
pkgname=openshift-client-bin
pkgver=4.6.17
pkgrel=1
pkgdesc="Client tools for OpenShift, binary release"
arch=("x86_64")
provides=("oc")
conflicts=("okd-client-bin" "origin-client" "origin-client-bin")
url="https://github.com/openshift/oc"
license=("Apache")
depends=()

source=("https://mirror.openshift.com/pub/openshift-v4/clients/ocp/${pkgver}/openshift-client-linux.tar.gz")

sha256sums=('af367edf30b61876b2c763958796bde30fbc99e14f83ef2e3c4e72b53eb0efcc')

prepare() {
  # generate completion
  $srcdir/oc completion bash > $srcdir/bash-completions
  $srcdir/oc completion zsh > $srcdir/zsh-completions
}

package() {
  install -Dm644 $srcdir/bash-completions $pkgdir/usr/share/bash-completion/completions/oc
  install -Dm644 $srcdir/zsh-completions $pkgdir/usr/share/zsh/site-functions/_oc
  install -Dm755 "${srcdir}/oc" "${pkgdir}/usr/local/bin/oc"
}

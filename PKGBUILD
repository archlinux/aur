# Maintainer: Josh Gwosdz <jgwosdz at redhat dot com>
pkgname=openshift-client-bin
pkgver=4.7.1
pkgrel=1
pkgdesc="Client tools for OpenShift, binary release"
arch=("x86_64")
provides=("oc")
conflicts=("okd-client-bin" "origin-client" "origin-client-bin")
url="https://github.com/openshift/oc"
license=("Apache")
depends=()

source=("https://mirror.openshift.com/pub/openshift-v4/clients/ocp/${pkgver}/openshift-client-linux.tar.gz")

sha256sums=('a4dbfb580c3560724a10f8bb3c81781d8b4a00d4b050961d27511d83d2a61063')

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

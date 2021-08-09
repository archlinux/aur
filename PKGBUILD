# Maintainer: Josh Gwosdz <jgwosdz at redhat dot com>
pkgname=openshift-client-bin
pkgver=4.8.3
pkgrel=1
pkgdesc="Client tools for OpenShift, binary release"
arch=("x86_64")
provides=("oc")
conflicts=("okd-client-bin" "origin-client" "origin-client-bin")
url="https://github.com/openshift/oc"
license=("Apache")
depends=()

source=("$pkgname-$pkgver.tar.gz::https://mirror.openshift.com/pub/openshift-v4/clients/ocp/${pkgver}/openshift-client-linux.tar.gz")

sha256sums=('7d02831a2b3ed599cdce3b89aa833ba46207f130a6c057f4540fc0bf7f79917f')

prepare() {
  # generate completion
  $srcdir/oc completion bash > $srcdir/bash-completions
  $srcdir/oc completion zsh > $srcdir/zsh-completions
}

package() {
  install -Dm644 $srcdir/bash-completions $pkgdir/usr/share/bash-completion/completions/oc
  install -Dm644 $srcdir/zsh-completions $pkgdir/usr/share/zsh/site-functions/_oc
  install -Dm755 "${srcdir}/oc" "${pkgdir}/usr/bin/oc"
}

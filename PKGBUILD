# Maintainer: Josh Gwosdz <jgwosdz at redhat dot com>
pkgname=openshift-client-bin
pkgver=4.14.11
pkgrel=1
pkgdesc="Client tools for OpenShift, binary release"
arch=("x86_64")
provides=("oc")
conflicts=("okd-client-bin" "origin-client" "origin-client-bin")
url="https://github.com/openshift/oc"
license=("Apache")
depends=()

source=("$pkgname-$pkgver.tar.gz::https://mirror.openshift.com/pub/openshift-v4/clients/ocp/${pkgver}/openshift-client-linux.tar.gz")

sha256sums=('91a79c34c3ef549b733610486a0fe19ddda49851b053829163aac188586ae236')

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

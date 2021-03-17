# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=okd-client-bin
pkgver=4.7.0_0
pkgrel=1
pkgdesc="Client tools for OpenShift"
arch=(x86_64)
url="https://github.com/openshift/okd"
license=('Apache')

pkgdate="2021-03-07-090821"
linuxver="4.7.0-0"

source=("https://github.com/openshift/okd/releases/download/${pkgver//_/-}.okd-${pkgdate}/openshift-client-linux-${linuxver}.okd-${pkgdate}.tar.gz")

sha256sums=('7949f33d6e671c98859ab4a13908f341a69430f030643d6ebce43425151bd559')

prepare() {
    # generate completion
    $srcdir/oc completion bash > $srcdir/bash-completions
    $srcdir/oc completion zsh > $srcdir/zsh-completions
}

package() {
    # completions
    install -D -m644 $srcdir/bash-completions $pkgdir/usr/share/bash-completion/completions/oc
    install -D -m644 $srcdir/zsh-completions $pkgdir/usr/share/zsh/site-functions/_oc

    # package
    install -D -m755 $srcdir/oc $pkgdir/usr/bin/oc
}

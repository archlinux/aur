# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>

pkgname=openshift-install
pkgver=4.18.10
pkgrel=1
pkgdesc="Install an OpenShift 4.x cluster"
arch=("x86_64")
url="https://github.com/openshift/installer"
license=("Apache-2.0")
depends=(
    'glibc'
)
source=("$pkgname-$pkgver.tar.gz::https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/ocp/stable/openshift-install-linux-$pkgver.tar.gz")
sha256sums=('3d5dd0466654ed36da37abd3b35586d6199e23660b050fbcd0241f1d7afd20ae')

prepare() {
    cd "$srcdir" || exit
    ./openshift-install completion bash > bash-completion-config
}

package() {
    cd "$srcdir" || exit
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "bash-completion-config" "${pkgdir}/usr/share/bash-completion/completions/openshift-install"
    install -Dm755 "openshift-install" "${pkgdir}/usr/bin/openshift-install"
}

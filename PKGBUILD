# Maintainer: Simon Weald <simon[at]simonweald[dot]com>

pkgname=gwctl-bin
_srcname=gwctl
pkgdesc="gwctl is a command-line tool for managing and understanding Gateway API resources in your Kubernetes cluster"
pkgver=0.1.0
pkgrel=1
arch=('x86_64')
url="https://github.com/kubernetes-sigs/gwctl"
license=('apache')
source=("${_srcname}-${pkgver}.tar.gz::https://github.com/kubernetes-sigs/gwctl/releases/download/v${pkgver}/${_srcname}_Linux_x86_64.tar.gz")
sha256sums=('0b6c4314599e29fd16ae41fc9d851a9b1e7b2dcab74b4b8cbd7eb91e72e0118a')

package() {
    cd ${srcdir}
    tar --strip-components=1 -xzf ${_srcname}-${pkgver}.tar.gz

    install -Dm755 "${srcdir}/${_srcname}" "${pkgdir}/usr/bin/${_srcname}"

    "${pkgdir}/usr/bin/${_srcname}" --completion=bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${_srcname}"
    "${pkgdir}/usr/bin/${_srcname}" --completion=zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${_srcname}"
}

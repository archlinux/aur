# Maintainer: Simon Weald <simon[at]simonweald[dot]com>

pkgname=gsctl-bin
_srcname=gsctl
pkgdesc="The Giant Swarm command line interface"
pkgver=1.1.3
pkgrel=1
arch=('x86_64')
url="https://github.com/giantswarm/gsctl/"
license=('apache')
source=("${_srcname}-${pkgver}.tar.gz::https://github.com/giantswarm/gsctl/releases/download/${pkgver}/${_srcname}-${pkgver}-linux-amd64.tar.gz")
sha256sums=('98e141841d005d1f3513cceed2ebd78bdda00fdc0e9a68411c0a14479401fdeb')

package() {
    cd ${srcdir}
    tar -xzf ${_srcname}-${pkgver}.tar.gz
    install -Dm755 "${srcdir}/${_srcname}-${pkgver}-linux-amd64/${_srcname}" "${pkgdir}/usr/bin/${_srcname}"

    "${pkgdir}/usr/bin/${_srcname}" completion bash --stdout | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${_srcname}"
    "${pkgdir}/usr/bin/${_srcname}" completion zsh --stdout | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${_srcname}"
}

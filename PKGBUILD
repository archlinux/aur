# Maintainer: Simon Weald <simon[at]simonweald[dot]com>

pkgname=stern-bin
_srcname=stern
pkgdesc="Multi pod and container log tailing for Kubernetes"
pkgver=1.33.1
pkgrel=1
arch=('x86_64')
url="https://github.com/stern/stern"
license=('apache')
source=("${_srcname}-${pkgver}.tar.gz::https://github.com/stern/stern/releases/download/v${pkgver}/${_srcname}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('185be29c6a22bd07c0791ec697900943c0cc27292e5a5640a07a543886f1bfc9')

package() {
    cd ${srcdir}
    tar --strip-components=1 -xzf ${_srcname}-${pkgver}.tar.gz

    install -Dm755 "${srcdir}/${_srcname}" "${pkgdir}/usr/bin/${_srcname}"

    "${pkgdir}/usr/bin/${_srcname}" --completion=bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/stern"
    "${pkgdir}/usr/bin/${_srcname}" --completion=zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_stern"
}

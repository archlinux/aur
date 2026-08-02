# Maintainer: Moritz Luedecke <moritz.luedecke@skweez.net>

pkgname=gitflow-next-bin
pkgver=1.2.0
pkgrel=1
pkgdesc='A modern reimplementation of git-flow in Go.'
arch=('i686' 'x86_64' 'aarch64')
url='https://git-flow.sh'
license=('BSD-2-Clause')
depends=('git')
provides=('gitflow')
conflicts=('gitflow' 'gitflow-git' 'gitflow-avh')
_baseurl="https://github.com/gittower/git-flow-next/releases/download/v${pkgver}"
source=("https://github.com/gittower/git-flow-next/blob/v${pkgver}/README.md" "https://github.com/gittower/git-flow-next/blob/v${pkgver}/LICENSE")
source_i686=("${_baseurl}/git-flow-next-v${pkgver}-linux-386.tar.gz")
source_x86_64=("${_baseurl}/git-flow-next-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${_baseurl}/git-flow-next-v${pkgver}-linux-arm64.tar.gz")
sha256sums=('SKIP' 'SKIP')
sha256sums_i686=('1e4589781aafe325c510800261e803597ebc98aa88d0c31bf6492d593fbb17bf')
sha256sums_x86_64=('04f8c66588751907a9149a107d97ef4fa190252799ffd644e711040c96209bc1')
sha256sums_aarch64=('a80d3d68ea4797adbfd02687edaccb5d175a1df5ecbebace277bb6b75a0cd004')

package() {
    if [ "${CARCH}" == "i686" ]; then
        _arch='386'
    elif [ "${CARCH}" == "x86_64" ]; then
        _arch='amd64'
    else
        _arch='arm64'
    fi

    install -Dm755 "${srcdir}/git-flow-v${pkgver}-linux-${_arch}" "${pkgdir}/usr/bin/git-flow"

    mkdir -p "${pkgdir}/usr/share/doc/${pkgname}/" "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/"
}

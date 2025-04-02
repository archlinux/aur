# Maintainer: Strykar <strykar@hotmail.com>

_pkgname=ntpperf
pkgname=ntpperf-git
pkgver=r28.4d1de40
pkgrel=2
pkgdesc="A tool for measuring performance of NTP servers and PTP masters"
arch=('x86_64' 'aarch64')
url="https://github.com/mlichvar/ntpperf"
license=('GPL-2.0-only')
depends=('libpcap')
makedepends=('git' 'make' 'gcc')
optdepends=('gnutls: for Network Time Security (NTS) support')
source=("git+https://github.com/mlichvar/ntpperf.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}"
    export NTPPERF_NTS=1
    make
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -Dm755 ntpperf "${pkgdir}/usr/bin/ntpperf"
    install -Dm644 README.adoc "${pkgdir}/usr/share/doc/${_pkgname}/README.adoc"
}

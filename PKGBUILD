# Maintainer:  Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=entropy-assessment
pkgver=1.1.3
pkgrel=1
pkgdesc="C++ implementation of the NIST Special Publication 800-90B"
url="https://github.com/usnistgov/SP800-90B_EntropyAssessment"
arch=('x86_64')
license=('custom:public-domain')
makedepends=(
    'jsoncpp'
    'libdivsufsort'
)
source=("https://github.com/usnistgov/SP800-90B_EntropyAssessment/archive/refs/tags/v$pkgver.tar.gz")
b2sums=("68c141aaef6e03ed448b654e2f0cf93cb4ed113ed41f718f34653922c70f4a0929a60fceedd05de4d4b264a8b3812ba585bd78388857e3dd0719224c94665c15")

build() {
    cd "SP800-90B_EntropyAssessment-1.1.3/cpp"
    make all
}

check() {
    cd "SP800-90B_EntropyAssessment-1.1.3/cpp/selftest"
    /bin/bash selftest
}

package() {
    cd "SP800-90B_EntropyAssessment-1.1.3/cpp"
    install -Dm755 ea_iid "$pkgdir/usr/bin/ea_iid"
    install -Dm755 ea_non_iid "$pkgdir/usr/bin/ea_non_iid"
    install -Dm755 ea_restart "$pkgdir/usr/bin/ea_restart"
    install -Dm755 ea_conditioning "$pkgdir/usr/bin/ea_conditioning"
    install -Dm755 ea_transpose "$pkgdir/usr/bin/ea_transpose"
}

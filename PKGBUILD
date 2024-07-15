# Maintainer:  Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=entropy-assessment
pkgver=1.1.8
_pkgname=SP800-90B_EntropyAssessment-$pkgver
pkgrel=1
pkgdesc="C++ implementation of the NIST Special Publication 800-90B"
url="https://github.com/usnistgov/SP800-90B_EntropyAssessment"
arch=('x86_64')
license=('custom:public-domain')
depends=(
    'bzip2'
    'jsoncpp'
    'libdivsufsort'
    'mpfr'
    'openssl'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/usnistgov/SP800-90B_EntropyAssessment/archive/refs/tags/v$pkgver.tar.gz"
    "LICENSE"
)
b2sums=('e7a2466cf2b7403b2db3c64412ef47cd7134cdb247b395065efbe88c9f54e8a372083ea8b20fcd71bb1bfb3ea6e06383c361d4e314e4841e7173b043d7718b60'
        'eb7559b09ecf5c19cea59d1c4deb5df4b4f6648291ed8e6c4a5eb57c0ee901c309b4d501f1b41ae088f4785c8b73e75ca92df62bd963e2ebc6a1b2f6e46e2054')

build() {
    cd "$_pkgname/cpp"
    make LDFLAGS="$LDFLAGS" all
}

check() {
    cd "$_pkgname/cpp/selftest"
    /bin/bash selftest
}

package() {
    cd "$_pkgname/cpp"
    install -Dm755 ea_iid "$pkgdir/usr/bin/ea_iid"
    install -Dm755 ea_non_iid "$pkgdir/usr/bin/ea_non_iid"
    install -Dm755 ea_restart "$pkgdir/usr/bin/ea_restart"
    install -Dm755 ea_conditioning "$pkgdir/usr/bin/ea_conditioning"
    install -Dm755 ea_transpose "$pkgdir/usr/bin/ea_transpose"
    install -Dm644 ${srcdir}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

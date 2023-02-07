# Maintainer: Gee
# Co-Maintainer: Leon Möller <jkhsjdhjs at totally dot rip>

pkgname="nzbhydra2-nojava-bin"
pkgver=5.1.2
pkgrel=1
pkgdesc="Search aggregator for newznab and torznab indexers."
arch=('x86_64' 'aarch64')
url="https://github.com/theotherp/nzbhydra2"
license=('Apache')
provides=('nzbhydra2')
conflicts=('nzbhydra2')
depends=('python')
optdepends=('jackett: torrent indexer proxy')

source=('nzbhydra2.service'
        'nzbhydra2.tmpfiles'
        'nzbhydra2.sysusers'
        'nzbhydra2.sh'
        'wrapper-remove-base-path-checks.patch'
        'wrapper-remove-update-support.patch'
        'wrapper-remove-release-type-detection.patch')
source_x86_64=("https://github.com/theotherp/nzbhydra2/releases/download/v${pkgver}/${pkgname%-nojava-bin}-${pkgver}-amd64-linux.zip")
source_aarch64=("https://github.com/theotherp/nzbhydra2/releases/download/v${pkgver}/${pkgname%-nojava-bin}-${pkgver}-arm64-linux.zip")

sha256sums=('cddea77be49001614826d792e52365c014a1e0056b0210d1e1542c3d37bf8bf7'
            'a9ceeed2b50d55c5e554c0d4c615e855fe4d3889eb118e37908fa04ffb7cb003'
            '8f91eb4f98f7f5c11590b29b1394dfa7ca62ad115feeac4f402c9ac094fb925a'
            '8127f92afb0f70b6f79c11db0219f8b2557cb7bcafa16fd6ddb2d61166d216fe'
            '5660f26303826a0b8bf3f7c198c39e345e87b799e2304a79db5a77992d09cda4'
            '35100f4e7ab5a480f5554d9abd32e8abac20d56f873f82ecbc906d0b3fdadc73'
            '73fe3e7d877f4f9f301deef9f699a357a9a1574148aedb565832f0375c99bdda')
sha256sums_x86_64=('832b6bc1aecc2b1905e62727893a5a1b79d747a1c372204b772e1b7f2b4fe3ce')
sha256sums_aarch64=('7abda7cd4ed8d6cf5100e5bbfd1d2db09d7ad4cfb289e5ab9b725afc2a1696f5')

prepare() {
    patch "${srcdir}/nzbhydra2wrapperPy3.py" < "${srcdir}/wrapper-remove-base-path-checks.patch"
    patch "${srcdir}/nzbhydra2wrapperPy3.py" < "${srcdir}/wrapper-remove-update-support.patch"
    patch "${srcdir}/nzbhydra2wrapperPy3.py" < "${srcdir}/wrapper-remove-release-type-detection.patch"
}

package() {
    install -D -m 755 "${srcdir}/nzbhydra2.sh" "${pkgdir}/usr/bin/nzbhydra2"
    install -D -m 755 "${srcdir}/nzbhydra2wrapperPy3.py" "${pkgdir}/usr/lib/nzbhydra2/nzbhydra2wrapperPy3.py"
    install -D -m 755 "${srcdir}/core" "${pkgdir}/usr/lib/nzbhydra2/core"
    install -D -m 644 "${srcdir}/readme.md" "${pkgdir}/usr/share/doc/nzbhydra2/readme.md"

    install -D -m 644 "${srcdir}/nzbhydra2.service" "${pkgdir}/usr/lib/systemd/system/nzbhydra2.service"
    install -D -m 644 "${srcdir}/nzbhydra2.sysusers" "${pkgdir}/usr/lib/sysusers.d/nzbhydra2.conf"
    install -D -m 644 "${srcdir}/nzbhydra2.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/nzbhydra2.conf"
}

pkgdesc="Intel® RealSense™ Cross Platform"
url="https://www.intelrealsense.com/"

pkgname='librealsense2-dkms'
pkgver='2.54.2'
arch=('x86_64')
pkgrel=1
license=("Apache-2.0")

makedepends=(
    make
    bc
)

depends=(
    dkms
    librealsense2
)

source=(
    "arch.patch"
    "build.bash"
    "dkms.conf"
)
sha256sums=(
    '8d78188d6a508f39c67ab5006c7c6422b8c4e7e00023818feae2e8332335798c'
    '772bd5620684c04978a2007fe4c32960fed5165b262fba27700dc0b9d6c25ea6'
    '617949cc61c73bc933087fc06cf4428b163efe27d2d329f5aea3b4f8915f9a48'
)

prepare() {
    echo "This package should not be used anymore. The latest kernel already support realsense2. It will be removed soon."
    exit 1
}

package() {
    # Copy dkms.conf and arch.patch
    cd "${srcdir}"
    install -Dm644 dkms.conf "${pkgdir}/usr/src/${pkgname}-${pkgver}/dkms.conf"
    install -Dm644 arch.patch "${pkgdir}/usr/src/${pkgname}-${pkgver}/patches/arch.patch"
    install -Dm644 build.bash "${pkgdir}/usr/src/${pkgname}-${pkgver}/build.bash"

    # Set name and version
    sed -e "s/@PKGNAME@/${pkgname}/g" \
        -e "s/@PKGVER@/${pkgver}/g" \
        -i "${pkgdir}/usr/src/${pkgname}-${pkgver}/dkms.conf"
}

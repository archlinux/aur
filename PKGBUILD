# Maintainer: Konrad Heidler(cloud-oak) <k.heidler@tum.de>

pkgname=imagevis3d-bin
pkgver=3.1.0
pkgrel=1
pkgdesc="ImageVis3D is a new volume rendering program developed by the NIH/NIGMS Center for Integrative Biomedical Computing. The main design goals are simplicity, scalability, and interactivity.."
depends=('qt4')
makedepends=()
arch=('x86_64')
license=('MIT')
url="http://www.sci.utah.edu/software/imagevis3d.html"

provides=('imagevis3d')
conflicts=()

source=("http://www.sci.utah.edu/releases/imagevis3d_v3.1.0/ImageVis3D-${pkgver}-Ubuntu-13.10-${CARCH}.tar.gz"
        "https://raw.githubusercontent.com/SCIInstitute/ImageVis3D/master/ImageVis3D/Resources/icon_128.png"
        "imagevis3d.desktop")
sha512sums=('e48a9cc52e49209c2c70b34286b87024c9722b4346c2033bfb3c02c54fbb6871a32ab775a299a507b9eb6ec12fece87746ef72fa569637f67f69aaa93e5fbf16'
            '9e3da908b0705a801783a2a3d529e6a61d31bcaa8c2e4812b3e95750ba7c0263f8025e6e5057844526f6c23c7f7a488e547035a78e388e0985d51345b6145cab'
            '64546ea80c9dab14da3812a13ecd4ac92d66ed6a077bd5b77886edc74133225b4edc8cda912d7d68ab0344572625fb8a0f3e42a8cef2d7028ac63f710afb6783')

package() {
    mkdir "${pkgdir}/opt"
    cp -r "${srcdir}/ImageVis3D-${pkgver}" "${pkgdir}/opt/imagevis3d"

    mkdir -p "${pkgdir}/usr/bin"
    echo -e "#!/bin/bash\ncd /opt/imagevis3d/\n./ImageVis3D" > "${pkgdir}/usr/bin/imagevis3d"
    echo -e "#!/bin/bash\ncd /opt/imagevis3d/\n./uvfconvert" > "${pkgdir}/usr/bin/uvfconvert"

    chmod +x "${pkgdir}/usr/bin/imagevis3d" "${pkgdir}/usr/bin/uvfconvert"
    mkdir -p "${pkgdir}/usr/share/icons"
    cp "${srcdir}/icon_128.png" "${pkgdir}/usr/share/icons/imagevis3d.png"

    mkdir -p "${pkgdir}/usr/share/applications"
    cp "${srcdir}/imagevis3d.desktop" "${pkgdir}/usr/share/applications/imagevis3d.desktop"
}

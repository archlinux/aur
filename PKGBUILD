# Maintainer: V0IDPlusPlus <v0idplusplus at protonmail dot com>
# Maintainer: shilka <shilkazx at gmail dot com>

pkgname=tencent-docs-bin
pkgver=3.5.0
pkgrel=1
pkgdesc="腾讯文档 Tencent Docs - 让协作更高效，创作更轻松"
arch=("x86_64" "aarch64")
url="https://docs.qq.com/home/"

source=(
    "tencent-docs.desktop"
)
source_x86_64=("${pkgname}-${pkgver}-${pkgrel}-x86_64.deb::https://github.com/V0IDPlusPlus/Tencent-Docs-Debian-Package-Archive/releases/download/v${pkgver}-${pkgrel}/LinuxTencentDocsAmd64.deb")
source_aarch64=("${pkgname}-${pkgver}-${pkgrel}-aarch64.deb::https://github.com/V0IDPlusPlus/Tencent-Docs-Debian-Package-Archive/releases/download/v${pkgver}-${pkgrel}/LinuxTencentDocsArm64.deb")

sha256sums=("7dd7432ece74ddd5d5fd6de07e6b521a4b84206a8fa099b754f2a994641404d7")
sha256sums_x86_64=("e7a287fd03f8487420e3d60964bfeac318f44755ef5c8a9a5a51980fed8c1d4b")
sha256sums_aarch64=("a74edc6d3d653ce8ed4357615af480cef94cb0fc17237e6efb9b7adcc7d2012b")

package() {
    tar xpf data.tar.xz -C ${pkgdir}

    install -Dm 644 ./tencent-docs.desktop ${pkgdir}/usr/share/applications/tencent-docs.desktop
    rm -rf ${pkgdir}/usr/share/applications/tdappdesktop.desktop

    cd ${pkgdir}/opt
    mkdir tencent
    mv 腾讯文档 tencent/tencent-docs

    cd ${pkgdir}/opt/tencent/tencent-docs
    chmod a+x ./tdappdesktop

    mkdir ${pkgdir}/usr/bin
    ln -sf /opt/tencent/tencent-docs/tdappdesktop ${pkgdir}/usr/bin/tdocs
}

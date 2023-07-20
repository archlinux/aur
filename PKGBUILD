# Maintainer: V0IDPlusPlus <v0idplusplus at protonmail dot com>
# Maintainer: shilka <shilkazx at gmail dot com>

pkgname=tencent-docs-bin
pkgver=3.1.1
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
sha256sums_x86_64=("7b9f69f3f77ab584f32e3b080fb759741c45a078b1b9be7d2e9675eb71c50291")
sha256sums_aarch64=("933de59ce1edb3a51d8437f9a09473a8589bd00999081122438966f3662d6b23")

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

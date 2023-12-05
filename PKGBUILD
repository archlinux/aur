# Maintainer: V0IDPlusPlus <v0idplusplus at protonmail dot com>
# Maintainer: shilka <shilkazx at gmail dot com>

pkgname=tencent-docs-bin
pkgver=3.1.11
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
sha256sums_x86_64=("41283a3287962275370b23a653aba23613d6d18fc139ed935f25543e912d7d3f")
sha256sums_aarch64=("81ac69e01fc5a44826127c4f9f283034b3dd104c6963072079645f5104074cfc")

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

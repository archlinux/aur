# Maintainer: dingjing <dingjing at live dot cn>

pkgname=tencent-docs
pkgver=3.1.0
pkgrel=1
pkgdesc="腾讯文档 Tencent Docs (官网 2023-06-19 版本)"
arch=("x86_64")
url="https://docs.qq.com/home/"

makedepends=('dpkg')

conflicts=('tencent-docs-bin')

source=(
    "tencent-docs.desktop"
    "${pkgname}-${pkgver}-${pkgrel}-x86_64.deb::https://down.qq.com/qqweb/linux_docs/LinuxTencentDocsAmd64.deb"
)

sha256sums=(
    "7dd7432ece74ddd5d5fd6de07e6b521a4b84206a8fa099b754f2a994641404d7"
    "7c24657c22891aec831f567de01d1a0f27742bf7c082801b2fe3527ac02432a9"
)

package() {
    install -Dm 644 ./tencent-docs.desktop ${pkgdir}/usr/share/applications/tencent-docs.desktop
    rm -rf ${pkgdir}/usr/share/applications/tdappdesktop.desktop

    dpkg -x "${srcdir}/${pkgname}-${pkgver}-${pkgrel}-x86_64.deb" "${pkgdir}"

    cd ${pkgdir}/opt
    mkdir tencent
    mv 腾讯文档 tencent/tencent-docs

    cd ${pkgdir}/opt/tencent/tencent-docs
    chmod a+x ./tdappdesktop

    mkdir ${pkgdir}/usr/bin
    ln -sf /opt/tencent/tencent-docs/tdappdesktop ${pkgdir}/usr/bin/tdocs
}

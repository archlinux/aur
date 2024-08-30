# Maintainer: V0IDPlusPlus <v0idplusplus at protonmail dot com>
# Maintainer: shilka <shilkazx at gmail dot com>

pkgname=tencent-docs-bin
pkgver=3.8.1
pkgrel=1
pkgdesc="腾讯文档 Tencent Docs - 让协作更高效，创作更轻松"
arch=("x86_64" "aarch64")
url="https://docs.qq.com/home/"

source=(
    "tencent-docs.desktop"
)
depends=(
    "electron"
)
source_x86_64=("${pkgname}-${pkgver}-${pkgrel}-x86_64.deb::https://docs.qq.com/api/package/get?channel_id=30001&version_id=${pkgver}&package_name=TencentDocs-x64.deb")
source_aarch64=("${pkgname}-${pkgver}-${pkgrel}-aarch64.deb::https://docs.qq.com/api/package/get?channel_id=30001&version_id=${pkgver}&package_name=TencentDocs-arm64.deb")


sha256sums=("7dd7432ece74ddd5d5fd6de07e6b521a4b84206a8fa099b754f2a994641404d7")
sha256sums_x86_64=('6d08eea5b2938bc6d07be1f6aa0ec618ebed2ce6e7e240f8bb22ed1b4a1f7237')
sha256sums_aarch64=('7ab7a0fc74aca6b750acb1439478b3477a7121eadd6a66a001cd4b81d2144793')

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

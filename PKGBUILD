# Maintainer: loss
pkgname=aghub-bin
pkgver=1.9.1
pkgrel=1
# 上游 release tag。与 pkgver 分开保存：像 v1.9.0-beta.1 / v1.3.0-1 这类 tag 无法
# 直接当 pkgver（不能含连字符），映射后也还原不回去，所以 source URL 用这个变量。
_upstream_tag=v1.9.1
pkgdesc="One hub for every AI coding agent - unified configuration management for 22+ assistants"
arch=('x86_64')
url="https://github.com/AkaraChen/aghub"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3')
provides=('aghub' 'aghub-cli')
conflicts=('aghub')
options=('!strip' '!debug')
source=("https://github.com/AkaraChen/aghub/releases/download/${_upstream_tag}/aghub_${_upstream_tag#v}_amd64.deb"
        "https://github.com/AkaraChen/aghub/releases/download/${_upstream_tag}/aghub-cli-x86_64-unknown-linux-gnu.tar.gz"
        "aghub.desktop")
sha256sums=('387bd65d459561779de6351231d3a68ace377cd17f0e1b078e6a256f77562171'
            '8892371c82023da5082c1039a7353494911cafddfe589b8e0ed2e30fda23bb68'
            'f5d925768036493dd03820589b63e29c686d0d087ea73f4db38d7fc06b30019f')

package() {
    cd "${srcdir}"

    # Extract deb data
    bsdtar -xf "${srcdir}/data.tar."* -C "${pkgdir}/"

    # CLI
    install -Dm755 aghub-cli -t "${pkgdir}/usr/bin/"

    # Desktop entry
    install -Dm644 aghub.desktop "${pkgdir}/usr/share/applications/aghub.desktop"
}

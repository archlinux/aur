# Maintainer: BryanLiang <liangrui.ch@gmail.com>

pkgname=aliyunpan-go-bin
_pkgname=aliyunpan-go
pkgver=0.2.9
pkgrel=1
pkgdesc='阿里云盘命令行客户端，支持webdav文件服务，支持JavaScript插件，支持同步备份功能。(Precompiled version)'
arch=('x86_64' 'aarch64' 'loong64')
url='https://github.com/tickstep/aliyunpan'
license=('Apache-2.0')
conflicts=("${_pkgname}")

source_x86_64=("${url}/releases/download/v${pkgver}/aliyunpan-v${pkgver}-linux-amd64.zip")
source_aarch64=("${url}/releases/download/v${pkgver}/aliyunpan-v${pkgver}-linux-arm64.zip")
source_loong64=("${url}/releases/download/v${pkgver}/aliyunpan-v${pkgver}-linux-loong64.zip")

sha512sums_x86_64=('d5df4d56b22b19531d886eae7d4780bb8f8d20acc542a28eaf152c2d0e89ee1d9fb7c6d3cb7fd82f00f3e936e4e7a70bdae9c1718ca0e79d61ddee870478f51a')
sha512sums_aarch64=('b4825b33058bda4159e2b2e4824aafeecde4e07f38a1f815026b2eb8e0014e0f0a5ba156ee4e8ef12987d381b96235a7748bf311b770f2c53294ab33539f96b5')
sha512sums_loong64=('afc8e94ea99cd10bcd4154cfd8719812577419bd007c297f8d7bcd87fe57161e4eaae4c0b37e438caef1e7b3807db9a560d48cec663bffdb1d403a09a39e14a2')

declare -A _archmap=(
    ['x86_64']='amd64'
    ['aarch64']='arm64'
    ['loong64']='loong64'
)

_arch="${_archmap[${CARCH}]}"

package() {
    cd "${srcdir}/aliyunpan-v${pkgver}-linux-${_arch}"
    install -Dm 755 aliyunpan "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm 755 webdav.sh "${pkgdir}/usr/bin/${_pkgname}-webdav"
    install -Dm 755 sync.sh "${pkgdir}/usr/bin/${_pkgname}-sync"
    install -Dm 644 manual.md -t "${pkgdir}/usr/share/doc/${_pkgname}"
}

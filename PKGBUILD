# Maintainer: BryanLiang <liangrui.ch@gmail.com>

pkgname=aliyunpan-go-bin
_pkgname=aliyunpan-go
pkgver=0.3.0
pkgrel=1
pkgdesc='阿里云盘命令行客户端，支持webdav文件服务，支持JavaScript插件，支持同步备份功能。(Precompiled version)'
arch=('x86_64' 'aarch64' 'loong64')
url='https://github.com/tickstep/aliyunpan'
license=('Apache-2.0')
conflicts=("${_pkgname}")

source_x86_64=("${url}/releases/download/v${pkgver}/aliyunpan-v${pkgver}-linux-amd64.zip")
source_aarch64=("${url}/releases/download/v${pkgver}/aliyunpan-v${pkgver}-linux-arm64.zip")
source_loong64=("${url}/releases/download/v${pkgver}/aliyunpan-v${pkgver}-linux-loong64.zip")

sha512sums_x86_64=('64c11b53753a485e180e74d7d64ef891320398f4590b9ebf418296641044f2ff47152eba8e1c82dfd9eef627fd18a7178186fd1a273a4f81f1624fa83ce34dae')
sha512sums_aarch64=('e9623eea5b1d0a2112d25b02aab44aa20315a94830cd6825e6f8b1831844b2eb6547965b03b056b2846191e222b6c2cf59de2357b1aa4f622cb3c312ab3c2b9d')
sha512sums_loong64=('d73272a8476ad65bf9be8e89531c9b23db09dd8729d9f977039d8e4e9cc61340a0592c277f42946eeb1f234c05031b320183858bf01aaa88ac58abdd7030ecd3')

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

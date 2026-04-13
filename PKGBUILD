# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=dedao
pkgname="${_pkgname}-dl-bin"
pkgver=1.2.19
pkgrel=1
pkgdesc="Get app course download tool, you can view article content in terminal, generate PDF, audio file, markdown manuscript, download e-book from DeDao.com.(Written in GO.Prebuilt version)得到APP课程下载工具,可在终端查看文章内容,可生成PDF,音频文件,markdown文稿,可下载电子书。"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/yann0917/dedao-dl"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
optdepends=(
    'wkhtmltopdf: Convert to PDF'
    'ffmpeg: Audio synthesis'
    'google-chrome: Generate PDF'
)
options=(
    '!strip'
)
noextract=("${pkgname%-bin}-${pkgver}-${CARCH}.tar.gz")
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/yann0917/dedao-dl/v${pkgver}/LICENSE")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-arm64.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-amd64.tar.gz")
sha256sums=('1ba8379d33340e518c32fe24046f7cb0530250ec193e7e3d0ea72fd558a1e926')
sha256sums_aarch64=('3434a690a5166dfb2ac635be7ce4f06ede0b94a29806f55c3899d89bce19a058')
sha256sums_x86_64=('7c645f26e5279bd573d2460fd079280dc3dcbff7edf41d85ed349df2d9c74770')
prepare() {
    cd "${srcdir}"
    bsdtar -xf "${pkgname%-bin}-${pkgver}-${CARCH}.tar.gz"
    case "${CARCH}" in
        aarch64)
            mv "${pkgname%-bin}-linux-arm64" "${pkgname%-bin}"
            ;;
        x86_64)
            mv "${pkgname%-bin}-linux-amd64" "${pkgname%-bin}"
            ;;
    esac
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

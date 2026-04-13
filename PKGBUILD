# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=dedao
pkgname="${_pkgname}-dl-bin"
pkgver=1.2.22
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
sha256sums_aarch64=('bd6ddb7d327fe244f721fc6a077147761da08b5aac7cbd37065401ba79b9aa48')
sha256sums_x86_64=('b33c3429fc683b25687e2c7f55127e7e57eba9d5976db4739945e5ce5e2d067b')
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

# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: snemc snemc @3112671039@qq.com
pkgname=umi-ocr-bin
_pkgname=Umi-OCR
pkgver=2.1.4
pkgrel=2
pkgdesc="Free, Open-source, Batch Offline OCR Software.(Prebuilt version)开源、免费的离线OCR软件。支持截屏/批量导入图片，PDF文档识别，排除水印/页眉页脚，扫描/生成二维码。内置多国语言库"
arch=('x86_64')
url="https://github.com/hiroi-sora/Umi-OCR"
license=('MIT')
depends=(
    'pyside6'
    'python-pymupdf>=1.23'
    'python-fonttools>=4.47'
    'python-pillow>=10.2'
    'python-psutil>=5.9'
    'python-pynput'
    'zxing-cpp'
    'qt6-webengine'
    'python-wheel'
    'python-defusedxml'
    'python-attrs'
    'libxrandr'
    'gdk-pixbuf2'
    'python-brotli'
    'libxcomposite'
    'python-setuptools'
    'qt6-virtualkeyboard'
    'python-pyqt6'
    'python-tornado'
    'python-reportlab'
    'libpulse'
    'python-typing_extensions'
    'python-jinja'
    'python-wxpython'
    'python-pyqt5'
    'python-cairo'
    'qt6-multimedia'
    'python-simplejson'
    'python-cryptography'
    'python-lz4'
    'python-mako'
    'qt6-quick3d'
    'python-lxml'
    'python-pip'
    'qt6-charts'
    'python-pyopenssl'
    'python-cffi'
    'python-docutils'
    'python-requests'
    'qt6-webengine'
)
makedepends=(
    'gendesk'
)
options=(
    '!strip'
)
source=("${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_Paddle_${pkgver}.tar.xz")
sha256sums=('0dae3a93eb4fc8da23097944f403d143430ec27a91ce3fa563ac5d363b69246e')
build() {
    gendesk -q -f -n --pkgname="${pkgname%-bin}" --pkgdesc="${pkgdesc}" --categories="Utility" --name="${_pkgname}" --exec="${pkgname%-bin}"
    find "${srcdir}/${_pkgname}_Linux_Paddle_${pkgver}" -type f -perm 600 -exec chmod 644 {} +
}
package() {
    install -Dm755 -d "${pkgdir}/usr/"{bin,lib/"${pkgname%-bin}"}
    cp -Pr --no-preserve=ownership "${srcdir}/${_pkgname}_Linux_Paddle_${pkgver}/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    ln -sf "/usr/lib/${pkgname%-bin}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname}_Linux_Paddle_${pkgver}/docs/images/icon-256.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}_Linux_Paddle_${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
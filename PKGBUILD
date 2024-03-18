# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=inethi-bin
pkgver=1.0.1
_electronversion=23
pkgrel=5
pkgdesc="A GUI installer that can set up the iNethi Docker environment."
arch=("x86_64")
url="https://www.inethi.org.za/software/"
_ghurl="https://github.com/iNethi/inethi-network-builder"
license=("GPL-3.0-only")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'python>3'
    'python-lxml'
    'python-pytz'
    'python-pillow'
    'python-importlib-metadata'
    'python-ptyprocess'
    'python-wheel'
    'python-docutils'
    'python-yaml'
    'python-six'
    'python-pexpect'
    'python-trove-classifiers'
    'python-cryptography'
    'python-typing_extensions'
    'python-platformdirs'
    'python-packaging'
    'python-pip'
    'python-setuptools'
    'python-pygments'
    'python-lockfile'
    'python-keyring'
    'python-zipp'
    'nodejs'
)
options=('!strip')
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('9e56a8eefe66574e99d04d198da338fc0577b2714450b1a61763d87b536e39dc'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/usr/lib/${pkgname%-bin}/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=inethi-bin
pkgver=1.0.1
_electronversion=23
pkgrel=7
pkgdesc="A GUI installer that can set up the iNethi Docker environment.(Prebuilt version.Use system-wide electron)"
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
    'python>=3'
    'ansible'
    'ansible-runner'
    'sshpass'
    'openssh'
)
options=(
    '!strip'
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('9e56a8eefe66574e99d04d198da338fc0577b2714450b1a61763d87b536e39dc'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/lib/${pkgname%-bin}/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}
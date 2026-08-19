# Maintainer: Harryhaha <harry_haha@foxmail.com>
# Contributor: BryanLiang <liangrui.ch@gmail.com>

pkgname=go-musicfox-bin
_pkgname=go-musicfox
pkgver=5.1.0
pkgrel=1
pkgdesc='Command-line Netease Cloud Music written in Go. (Precompiled version)'
url='https://github.com/go-musicfox/go-musicfox'
license=('MIT')
arch=('x86_64' 'aarch64' 'armv7h')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
depends=('alsa-lib' 'flac1.3')

source=('LICENSE')
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.zip")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.zip")
source_armv7h=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm.zip")

sha256sums=('20535828272932407c2f5172aeb714ac7b374a34e5ecb1825af509f2902cde54')
sha256sums_x86_64=('ac7e4c05140c0c861aa0fefdfd5e02f825a8a50c507a9457656847916ecea37a')
sha256sums_aarch64=('b16630b2c5c648332534b1dbbc4e91ae9668ad605d626f7407df931421aa4c33')
sha256sums_armv7h=('159a16a0957c48376f84336b0c2f7ae4896c0b0fb634dbd8a6d9ecac25776753')

declare -A _archmap=(
    ['x86_64']='amd64'
    ['aarch64']='arm64'
    ['armv7h']='arm'
)

_arch="${_archmap[$CARCH]}"
options=("!debug")
package() {
    cd "${srcdir}/"
    install -Dm 755 "${_pkgname}_${pkgver}_linux_${_arch}/musicfox" -t "${pkgdir}/usr/bin"
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}

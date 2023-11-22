# Maintainer: BryanLiang <liangrui.ch@gmail.com>

pkgname=spotifox-bin
pkgver=1.0.2
pkgrel=4
pkgdesc='Spotifox is yet another spotify CLI client similar to go-musicfox. (Precompiled version)'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/go-musicfox/spotifox'
license=('MIT')
conflicts=('spotifox')
depends=('glibc'
         'alsa-lib')

source=('https://raw.githubusercontent.com/go-musicfox/spotifox/master/LICENSE'
        'spotifox.png::https://raw.githubusercontent.com/go-musicfox/spotifox/master/previews/logo.png'
        'spotifox.desktop')
source_x86_64=("${url}/releases/download/v${pkgver}/spotifox_${pkgver}_linux_amd64.zip")
source_aarch64=("${url}/releases/download/v${pkgver}/spotifox_${pkgver}_linux_arm64.zip")
source_armv7h=("${url}/releases/download/v${pkgver}/spotifox_${pkgver}_linux_arm.zip")

sha256sums=('20535828272932407c2f5172aeb714ac7b374a34e5ecb1825af509f2902cde54'
            'c5be3b8375d0cff7661a7283c0e03b64f696059346a3441c79b41e28368aed24'
            'd66c6c3ca65aa5e8e847a77cd9ae52ffa805944ab52305ebcbec61e4b093d839')
sha256sums_x86_64=('23d3b1c97ce0407c7975b5bd5e8917e90486f52b50aa0b9c602658b6ea0fbba0')
sha256sums_aarch64=('062cfb2f7d6c14458fe08e9a5ac32b4041d021835ee313c41836fb0f1fd306cc')
sha256sums_armv7h=('5c15d13f3f75a72f9db3a815bac68b80379cf0917e86ecf411b7ea345fcf3461')

declare -A _archmap=(
    ['x86_64']='amd64'
    ['aarch64']='arm64'
    ['armv7h']='arm'
)

_arch="${_archmap[${CARCH}]}"

package() {
    cd "${srcdir}"
    install -Dm 755 "spotifox_${pkgver}_linux_${_arch}/spotifox" -t "${pkgdir}/usr/bin/"
    # The real size of logo is 1024x1024, but some application launchers do not support that size.
    install -Dm 644 spotifox.png -t "${pkgdir}/usr/share/icons/hicolor/512x512/apps"
    install -Dm 644 spotifox.desktop -t "${pkgdir}/usr/share/applications"
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/spotifox"
}

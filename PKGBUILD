# Maintainer: kuri <kurikuri22 at yandex dot com>
pkgname=bililive-go-bin
_pkgname=${pkgname%-bin}
pkgver=0.7.16
pkgrel=1
pkgdesc="pre build binary for bililive-go"
arch=("x86_64")
url="https://github.com/hr3lxphr6j/${_pkgname}"
rawurl="https://raw.githubusercontent.com/hr3lxphr6j/${_pkgname}/master/"
license=('GPL3')
depends=('ffmpeg')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
backup=(etc/${_pkgname}/config.yml)
source=("${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/bililive-linux-amd64.tar.gz"
        "LICENSE::${rawurl}LICENSE"
        "${_pkgname}@.service::${rawurl}contrib/systemd/bililive-go%40.service"
        "${_pkgname}.service::${rawurl}contrib/systemd/bililive-go.service")
b2sums=('3c9a1a254d481bbf9411262f9d56ede8def903371a23adb192eb086cc5121dae4dd3298712722e510a476be0dcccd757199fe4d74b98185900c1195d2d77cb69'
        'ab7e38fc42fb6686add7393ecc3c7ec622cc0d72d0304ded3e56c2f96dc8433c584520896a30c037affa44461ecccfaf3ffa4a97a7e050e8ed0ec4c592caa45c'
        '9becb61623ad2eccf72c796fbea9da3d5450aa3fc8bf843116daa58382d44b5eb937e97d15c1a21b495ba30a78b0a8c994ea20b8b08e51408204e836779bbd9e'
        '0e15c54d52d2f07eb376f31de3fd8091cdc370c7e6a7d73055838042148b95a37676e1732021c20e9966e17240906001b6e15b49e172e6c4dd94b396b4db7a2a')

prepare() {
  cd "${srcdir}"
  sed -i "s/save_last_log: true/save_last_log: false/" config.yml
}

package(){
  install -Dm644 "${_pkgname}@.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}@.service"		
  install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/user/${_pkgname}.service"		

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cd "${srcdir}"
  install -Dm755 bililive-linux-amd64 "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 config.yml "${pkgdir}/etc/${_pkgname}/config.yml"
}


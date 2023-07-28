# Maintainer: kuri <kurikuri22 at yandex dot com>
pkgname=bililive-go-bin
_pkgname=${pkgname%-bin}
pkgver=0.7.14
pkgrel=1
pkgdesc="pre build binary for bililive-go"
arch=("x86_64")
url="https://github.com/hr3lxphr6j/${_pkgname}"
license=('GPL3')
depends=('ffmpeg')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
backup=(etc/${_pkgname}/config.yml)
source=("${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/bililive-linux-amd64.tar.gz"
        "LICENSE::https://raw.githubusercontent.com/hr3lxphr6j/bililive-go/master/LICENSE"
        "${_pkgname}@.service"
        "${_pkgname}.service")
b2sums=('ed2f5d4be91ce5fe0e2e33c4f7a3140b46d96f5cb2bfbb43ed7ee0039d1a7d34c2fda14fda31ea84c284f125c43e953ede66438b06b1ba9132452a9a24cb40ea'
        'ab7e38fc42fb6686add7393ecc3c7ec622cc0d72d0304ded3e56c2f96dc8433c584520896a30c037affa44461ecccfaf3ffa4a97a7e050e8ed0ec4c592caa45c'
        'SKIP'
        'SKIP')

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


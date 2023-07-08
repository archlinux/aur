# Maintainer: kuri <kurikuri22 at yandex dot com>
pkgname=bililive-go-bin
_pkgname=${pkgname%-bin}
pkgver=0.7.13
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
b2sums=('b085d5d6b911c3b8b712de031bd36d434485060e5bd152f79c958ae990d58fd072e972759995ee541f0642d95dd42e321e0244930a6ddf6d1a41156fe643bc8a'
        'ab7e38fc42fb6686add7393ecc3c7ec622cc0d72d0304ded3e56c2f96dc8433c584520896a30c037affa44461ecccfaf3ffa4a97a7e050e8ed0ec4c592caa45c'
        'SKIP'
        'SKIP')

package(){
  install -Dm644 "${_pkgname}@.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}@.service"		
  install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/user/${_pkgname}.service"		

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cd "${srcdir}"
  install -Dm755 bililive-linux-amd64 "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 config.yml "${pkgdir}/etc/${_pkgname}/config.yml"
}


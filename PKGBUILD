# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="audiowrapper"
pkgname="${_pkgname}-bin"
pkgver=0.1.1
pkgrel=1
pkgdesc="A GUI for mp3splt and mp3wrap. The open source alternative to AlbumWrapper."
arch=('any')
url="https://${_pkgname}.sourceforge.net"
license=('GPL-2.0-or-later')
makedepends=('gendesk')
depends=('java-runtime' 'mp3splt' 'sh') # 'mp3wrap'
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
noextract=("${_pkgsrc}.jar")
source=("${_pkgsrc}.jar::https://downloads.sourceforge.net/sourceforge/${_pkgname}/AudioWrapper-${pkgver}.jar"
        "${_pkgname}.sh")
sha256sums=('a713ad10ef16ce38cb6a198190976a43cea3f3809b63f240703429932423cc32'
            'a9f1f64f5e5d5c150242ff0dcb4d98ea7051c68ed09057b22ece5d1be8b5d16c')

prepare() {
  cd "${srcdir}"
  gendesk -f \
    --pkgname "${_pkgname}" \
    --name "AudioWrapper" \
    --exec "/usr/bin/${_pkgname}" \
    --categories "AudioVideo;Utility;" \
    --comment "A GUI for mp3splt and mp3wrap" \
    --mimetype "application/x-java-archive" \
    --genericname "Audio Wrapper"
}

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}.sh"      "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm755 "${_pkgsrc}.jar"      "${pkgdir}/usr/share/java/${_pkgname}/${_pkgname}.jar"
  install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}

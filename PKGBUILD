# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=kapowarr
_pkgname=Kapowarr
pkgver=1.3.0
pkgrel=1
pkgdesc='Software to build and manage a comic book library, fitting in the *arr suite of software.'
arch=('x86_64')
url='https://github.com/Casvt/Kapowarr'
license=('GPL-3.0-or-later')
depends=(
  python-typing_extensions
  python-requests
  python-beautifulsoup4
  python-flask
  python-waitress
  python-cryptography
  python-bencoding
  python-aiohttp
  python-flask-socketio
  python-websocket-client
)
makedepends=(python)
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/V${pkgver}.tar.gz"
  kapowarr.service
  kapowarr.tmpfiles
  kapowarr.sysusers
)
sha256sums=('65a1199c80bd8d0c56369caa8d01ae15fc305d8030944a616139bccef230436f'
            '18213fb9bae7cd9004edfc99ec50832bc507b4a2614139afa81e0954a823f709'
            'ab76fd7e9d2ea854d596615b8a6c4ab984df107d8a96bb6a15cc9f711a0d5dcb'
            '72e466d84c18ed326ede2a5fddae36bbd9c44a1bac6199c73b98639d0796f7dd')

# check() {
#   cd "${_pkgname}-${pkgver}"
#
#   mkdir db
#   python -m unittest discover -s ./tests -p '*.py'
#   rm -rf db
# }

package() {
  cd "${_pkgname}-${pkgver}"

  install -dm755 "${pkgdir}/opt/kapowarr"
  cp -dpr --no-preserve=ownership * "${pkgdir}/opt/kapowarr"
  python -m compileall "${pkgdir}"

  cd "${srcdir}"
  install -Dm644 "kapowarr.service" "${pkgdir}/usr/lib/systemd/system/kapowarr.service"
  install -Dm644 "kapowarr.sysusers" "${pkgdir}/usr/lib/sysusers.d/kapowarr.conf"
  install -Dm644 "kapowarr.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/kapowarr.conf"
}

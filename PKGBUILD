# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=werckmeister-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="An open source Sheet Music MIDI Compiler"
arch=('x86_64')
url="http://werckme.github.io"
_githuburl="https://github.com/werckme/werckmeister"
license=('GPL3')
provides=()
depends=('alsa-lib' 'glibc' 'gcc-libs')
options=(!strip)
source=("${pkgname%-bin}-${pkgver}.sh::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-Linux.sh")
sha256sums=('ae262ef4583008c746d93a479cbff18c03bfa49f10d766379e0afbce6a8c493a')

package () {
  install -d "${pkgdir}/usr"
  chmod 755 "${srcdir}/${pkgname%-bin}-${pkgver}.sh"
  "./${pkgname%-bin}-${pkgver}.sh" --prefix="${pkgdir}/usr" --exclude-subdir --skip-license
  find "${pkgdir}/usr" -type f -exec chmod 755 * {} \;
  chown root:root -R "${pkgdir}"
  chmod 444 "${pkgdir}/usr/lib/librtmidi_static.a"
}
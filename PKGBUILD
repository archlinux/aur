# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=werckmeister-bin
pkgver=1.3.0
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
sha256sums=('5c9d5eff4a09183f3f286d636146c54bebf9c639ef891aa1053d1c35c7823d38')

package () {
  install -Dm755 -d "${pkgdir}/usr"
  chmod 755 "${srcdir}/${pkgname%-bin}-${pkgver}.sh"
  "./${pkgname%-bin}-${pkgver}.sh" --prefix="${pkgdir}/usr" --exclude-subdir --skip-license
  find "${pkgdir}/usr" -type f -exec chmod 755 * {} \;
  chown root:root -R "${pkgdir}"
  chmod 444 "${pkgdir}/usr/lib/librtmidi_static.a"
}

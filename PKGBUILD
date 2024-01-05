# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Brad Conte <brad AT bradconte.com>

set -u
pkgname='planetmule'
pkgver='1.3.6'; _rev='202002182011'
pkgrel='2'
pkgdesc='A free remake of, and tribute to, the 26 year old original role-playing game M.U.L.E.'
arch=('any')
url='http://www.planetmule.com'
license=('Freeware')
#depends=('openjdk6')
#depends=('jre7-openjdk')
depends=('fuse')
options=('!strip')
_appimage="${pkgname}-${pkgver}_${_rev}-amd64.AppImage"
source=(
  "https://master.dl.sourceforge.net/project/planetmule/${pkgver}/${_appimage}"
  'planetmule.desktop'
)
noextract=("${_appimage}")
md5sums=('e091046006df88340f94102cc60c31aa'
         '5e1c5ced9cf424bbccbdacc493ae3f2c')
sha256sums=('fb5d963b380baec47fc8171a7ea4fb64ef3ee9c9a90c7de72b660738d4cefffa'
            '6d862dadfa63a39747eac29e99929ef237b26012e7feb6eaeafe5f87ca323a81')

prepare() {
  set -u
  chmod +x "${_appimage}"
  ./"${_appimage}" --appimage-extract
  set +u
}

package() {
  set -u
  install -Dpm755 "${_appimage}" -t "${pkgdir}/opt/planetmule/"
  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/planetmule/${_appimage}" "${pkgdir}/usr/bin/planetmule"
  install -Dpm644 'planetmule.desktop' -t "${pkgdir}/usr/share/applications/"
  install -Dp 'squashfs-root/planemule.png' -t "${pkgdir}/opt/planetmule/"
  set +u
}
set +u

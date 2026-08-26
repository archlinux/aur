# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=plex-auto-languages
pkgver=1.6.0
pkgrel=1
pkgdesc='Updates the language of your Plex TV Show episodes based on the current language.'
url='https://github.com/JourneyDocker/Plex-Auto-Languages'
arch=('any')
license=('MIT')
depends=(
  'python-plexapi'
  'python-websocket-client'
  'apprise'
  'python-pyyaml'
  'python-schedule'
  'python-flask'
  'python-dateutil'
  'python-tqdm'
  'python-requests'
)

backup=('etc/plexautolanguages/config.yaml')

source=(
  "plex-auto-languages-${pkgver}.tar.gz::https://github.com/JourneyDocker/Plex-Auto-Languages/archive/refs/tags/${pkgver}.tar.gz"
  'plexautolanguages.service'
  'plexautolanguages.sysusers'
  'plexautolanguages.tmpfiles'
)
        
sha256sums=('7faafe99ba9ddf2062ad68a0554333a96d68a66b76c1bf6ea437ef8e1bae54dd'
            '1d36f4ebc641df340a3999debabf20c967c1c7dbd04e1af10a8edc070b708be9'
            '268b0f28c92bf1a4a35893f282b7c86acff5daee0a7979178fce778c3e1b90b6'
            'c4eeca811e761e3250d0a30ef5baabd55d4662d7eb6104267993d7510d8b0e27')

package() {
  mkdir -p "${pkgdir}/etc/plexautolanguages"
  install -D -m 644 "${srcdir}/Plex-Auto-Languages-${pkgver}/config/default.yaml" "${pkgdir}/etc/plexautolanguages/config.yaml"

  mkdir -p "${pkgdir}/usr/lib/plexautolanguages"
  cp -r "${srcdir}/Plex-Auto-Languages-${pkgver}/"* "${pkgdir}/usr/lib/plexautolanguages"

  install -D -m 644 "${srcdir}/plexautolanguages.service" "${pkgdir}/usr/lib/systemd/system/plexautolanguages.service"
  install -D -m 644 "${srcdir}/plexautolanguages.sysusers" "${pkgdir}/usr/lib/sysusers.d/plexautolanguages.conf"
  install -D -m 644 "${srcdir}/plexautolanguages.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/plexautolanguages.conf"
}

# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=vido
pkgver=1.2
pkgrel=1
pkgdesc='Video/Audio Downloader frontend for youtube-dl'
arch=('any')
url='https://sourceforge.net/projects/vido'
license=('GPL3')
conflicts=('vido-git')
depends=('python-gobject' 'gtk3' 'youtube-dl')
source=("${pkgname}-${pkgver}.zip::https://sourceforge.net/projects/vido/files/${pkgver}/vido_${pkgver}.zip/download")
sha256sums=('a52b66cfa5d983e61dd4c2f864df38b22490701af005ca29425d39a84f0dd06a')

package() {
  cd "${pkgname}"
  install -Dm755 vido.py -t "${pkgdir}/opt/vido/"
  install -Dm644 vido.svg -t "${pkgdir}/opt/vido/"
  install -Dm644 vido.glade -t "${pkgdir}/opt/vido/"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  echo "#!/usr/bin/env bash
  cd /opt/vido
  ./vido.py" > vido.sh
  install -Dm755 vido.sh "${pkgdir}/usr/bin/vido"
  gendesk -f -n --pkgname "${pkgname}" \
          --pkgdesc "$pkgdesc" \
          --name "Vido" \
          --comment "$pkgdesc" \
          --exec "${pkgname}" \
          --categories 'Utility;Network;AudioVideo' \
          --icon "${pkgname}"
  install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm644 vido.svg -t "${pkgdir}/usr/share/pixmaps"
}
# vim:set ts=2 sw=2 et:
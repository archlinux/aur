# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor : Dobroslaw Kijowski <dobo90_at_gmail.com>
# Contributor: Paul N. Maxwell <msg.maxwel@gmail.com>

pkgbase='transgui'
pkgname=("${pkgbase}-qt" "${pkgbase}-gtk")
pkgver='5.16.0'
pkgrel='1'
pkgdesc='A feature rich cross platform Transmission BitTorrent client. Faster and has more functionality than the built-in web GUI.'
arch=('i686' 'x86_64')
url="https://github.com/transmission-remote-gui/${pkgbase}"
license=("GPL")
makedepends=('lazarus' 'qt4pas' 'gtk2')
source=("${url}/archive/v${pkgver}.tar.gz"
        "${pkgbase}.desktop")
sha256sums=('58397c08dccf19fad3136e53937ca8d87c418484a0ea1abd8f7f7a5f21e789d3'
            '6c1723e084bd4afc908957e005dea60f919b42426d82cbcdee89239c64c6093d')

prepare() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  mkdir "${srcdir}/build-qt" "${srcdir}/build-gtk"
}

package_transgui-qt() {
  depends=('qt4pas')
  conflicts=('transgui-gtk2-git' 'transgui-qt4-git' 'transmission-remote-gui-qt4'
	    'transmission-remote-gui-gtk2' 'transmission-remote-gui-bin' 'transgui-gtk')

  cd "${srcdir}/${pkgbase}-${pkgver}"

  lazbuild "${pkgbase}.lpi" \
  --lazarusdir="/usr/lib/lazarus" \
  --widgetset="qt" \
  --primary-config-path=../build-qt

  install -Dm755 "units/${pkgbase}" "${pkgdir}/usr/bin/${pkgbase}"
  install -dm755 "${pkgdir}/usr/share/${pkgbase}/lang"
  install -Dm644 "lang"/transgui.* "${pkgdir}/usr/share/${pkgbase}/lang" 
  install -dm755 "${pkgdir}/usr/share/doc/${pkgbase}"
  install -Dm644 README.md history.txt LICENSE "${pkgdir}/usr/share/doc/${pkgbase}"
  install -Dm644 "${pkgbase}.png" "${pkgdir}/usr/share/pixmaps/${pkgbase}.png"
  install -Dm644 "${srcdir}/${pkgbase}.desktop" "${pkgdir}/usr/share/applications/${pkgbase}.desktop"

  rm "${pkgdir}/usr/share/${pkgbase}/lang/transgui.template"
}

package_transgui-gtk() {
  depends=('gtk2')
  conflicts=('transgui-gtk2-git' 'transgui-qt4-git' 'transmission-remote-gui-qt4'
	    'transmission-remote-gui-gtk2' 'transmission-remote-gui-bin' 'transgui-qt')

  cd "${srcdir}/${pkgbase}-${pkgver}"

  lazbuild "${pkgbase}.lpi" \
  --lazarusdir="/usr/lib/lazarus" \
  --widgetset="gtk" \
  --primary-config-path=../build-gtk

  install -Dm755 "units/${pkgbase}" "${pkgdir}/usr/bin/${pkgbase}"
  install -dm755 "${pkgdir}/usr/share/${pkgbase}/lang"
  install -Dm644 "lang"/transgui.* "${pkgdir}/usr/share/${pkgbase}/lang" 
  install -dm755 "${pkgdir}/usr/share/doc/${pkgbase}"
  install -Dm644 README.md history.txt LICENSE "${pkgdir}/usr/share/doc/${pkgbase}"
  install -Dm644 "${pkgbase}.png" "${pkgdir}/usr/share/pixmaps/${pkgbase}.png"
  install -Dm644 "${srcdir}/${pkgbase}.desktop" "${pkgdir}/usr/share/applications/${pkgbase}.desktop"

  rm "${pkgdir}/usr/share/${pkgbase}/lang/transgui.template"
}

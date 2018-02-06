# Maintainer: Ivan Semkin (ivan at semkin dot ru)

appname=DayJournal
pkgname=dayjournal
pkgver=23.0.6
pkgrel=1
pkgdesc="A minimalistic digital journal that lets the content you create outlast DayJournal itself"
arch=('any')
url="https://burnsoftware.wordpress.com/dayjournal/"
license=('GPL3')
depends=('gdk-pixbuf2' 'libgee' 'glib2' 'gtk3' 'libnotify' 'pango')
provides=('dayjournal')
conflicts=('dayjournal')

source=("https://launchpad.net/~thejambi/+archive/ubuntu/thejambi/+files/dayjournal_$pkgver.orig.tar.gz"
        'https://iballwasrawt.ru/dayjournal/dayjournal.png'
        'https://iballwasrawt.ru/dayjournal/dayjournal.desktop')
sha256sums=('92a1f3a167a2ea038716ec8b1fc4a2920fff8185e1fd1b3b36ae020ada3d690d'
            '901d182afa6c838077cb163edb80d1e76e23f3bdd9f436797d82a7f7560ac664'
            '1c2e09afd5fc1c6b5ac4b1fd807b1827462a89d824f0c09f5689b8a81dee294a')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed -i 's| appindicator3-0.1||' configure
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure
  make
}

package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/share/icons" 
  
  install -m755 "${srcdir}/${pkgname}-${pkgver}/src/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -m644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/icons/${pkgname}.png"
  install -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
# vim:set ts=2 sw=2 et:

# Maintainer: Damian Nowak <damian.nowak@atlashost.eu>
# Contributor: Alexsandr Pavlov <kidoz at mail dot ru>
# Contributor: Ernie Brodeur <ebrodeur@ujami.net>
# Contributor: Rogof <fake.bios at gmail>
# Contributor: m4.rc0 <m4.rc0 at o2 (dot) pl>
# Contributor: Bjørn Madsen <bm@aeons.dk>
pkgname='rubymine-eap'
_pkgname='RubyMine'
_pkgver='2016.1'
_pkgbuild='RC'
pkgver="${_pkgver}_${_pkgbuild}"
pkgrel='1'
pkgdesc="Ruby and Rails IDE with the full stack of essential developer tools (EAP)"
arch=('i686' 'x86_64')
options=('!strip')
url="http://www.jetbrains.com/rubymine"
license=('custom')
depends=('java-runtime')
source=(http://download.jetbrains.com/ruby/${_pkgname}-${_pkgver}-${_pkgbuild}.tar.gz
        rubymine-eap
        rubymine-eap.desktop)
sha256sums=('321a62910cae96e1251fb7f3e2f54397218d8167e5e6bfe83d99380d2e2f6104'
            '5907872548a4698c4a58a229296ff519031fba30b070257ff1a5e308faaff3c3'
            'bcb9d042247f8595befddca2feec3188350a0d89ba31ee6d4dd2c18ca4b854fc')
PKGEXT='.pkg.tar.gz' # prevent a time-consuming compression with xz

package() {
  cd "${srcdir}"

  realsrcdir="${_pkgname}-${_pkgver}/"

  mkdir -p "${pkgdir}/opt/${pkgname}"
  cp -r ${srcdir}/${realsrcdir}* "${pkgdir}/opt/${pkgname}"

  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/applications"
  mkdir -p "${pkgdir}/usr/share/pixmaps"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 "${startdir}/rubymine-eap.desktop" "${pkgdir}/usr/share/applications/rubymine-eap.desktop"
  install -m 644 "${pkgdir}/opt/${pkgname}/bin/RMlogo.svg" "${pkgdir}/usr/share/pixmaps/${pkgname}.svg"
  install -m 755 "${startdir}/rubymine-eap" "${pkgdir}/usr/bin/rubymine-eap"
}

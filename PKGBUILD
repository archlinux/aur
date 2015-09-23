# Maintainer: Chris Down <chris@chrisdown.name>
# Contributor: Iru Cai <mytbk920423\x40gmail 'dot' com>
# Contributor: Houlala <houlala 'at' gmail 'dot' com>
# Contributor: Olivier Duclos <olivier.duclos gmail.com>
# Contributor: wido <widomaker2k7@gmail.com>
# Contributor: VuDu <vudu 'dot' curse 'at' gmail 'dot' com>

pkgname=xnviewmp
pkgver=0.72
pkgrel=3
pkgdesc="An efficient multimedia viewer, browser and converter."
url="http://www.xnview.com/en/xnviewmp/"

arch=('x86_64' 'i686')
license=('custom')
depends=('glib2' 'expat' 'libpng12' 'gstreamer0.10-base' 'desktop-file-utils')
optdepends=('gvfs: support for moving files to trash')

install='xnviewmp.install'

source=("XnViewMP-linux-${pkgver}.tgz::http://download.xnview.com/XnViewMP-linux.tgz"
        "xnviewmp.desktop")
md5sums=('b131f97bb0c9eb7e6968cf1576ed9079'
         '24f44d5a881b94daf48775213a57e4ec')

if [ "$CARCH" = 'x86_64' ]; then
  source=("XnViewMP-linux-x64-${pkgver}.tgz::http://download.xnview.com/XnViewMP-linux-x64.tgz"
          "xnviewmp.desktop")
  md5sums=('4c16658a9cc6e701aabaf48f611da0eb'
           '24f44d5a881b94daf48775213a57e4ec')
fi


package() {
  install -d -m755 "${pkgdir}/opt/${pkgname}"
  install -d -m755 "${pkgdir}/usr/bin"
  install -d -m755 "${pkgdir}/usr/share/applications"

  cp -a "${srcdir}/XnView"/* "${pkgdir}/opt/${pkgname}"
  ln -s "/opt/${pkgname}/xnview.sh" "${pkgdir}/usr/bin/${pkgname}"

  install -m644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  install -D -m644 "${srcdir}/XnView/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:

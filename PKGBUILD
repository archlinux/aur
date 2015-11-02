# Maintainer: Evan Penner <gryffyn@archlinux 'dot' net>
# Contributor: Iru Cai <mytbk920423\x40gmail 'dot' com>
# Contributor: Houlala <houlala 'at' gmail 'dot' com>
# Contributor: Olivier Duclos <olivier.duclos gmail.com>
# Contributor: wido <widomaker2k7@gmail.com>
# Contributor: VuDu <vudu 'dot' curse 'at' gmail 'dot' com>

pkgname=xnviewmp
pkgver=0.76.1
pkgrel=2
pkgdesc="An efficient multimedia viewer, browser and converter."
url="http://www.xnview.com/en/xnviewmp/"

arch=('x86_64' 'i686')
license=('custom')
depends=('glib2' 'expat' 'libpng12' 'gstreamer0.10-base' 'desktop-file-utils' 'libxslt' 'qt5-multimedia' 'qt5-webkit' 'qt5-svg' 'qt5-x11extras')
optdepends=('gvfs: support for moving files to trash')

install='xnviewmp.install'

source_i686=("http://download.xnview.com/XnViewMP-linux.tgz"
	"http://www.xnview.com/beta/XnView-archx32.gz"
        "xnviewmp.desktop")

source_x86_64=("http://download.xnview.com/XnViewMP-linux-x64.tgz"
        "http://www.xnview.com/beta/XnView-archx64.gz"
        "xnviewmp.desktop")
md5sums_x86_64=('52bc161bae44ace8391525a0cf4bf668'
                'SKIP'
                '24f44d5a881b94daf48775213a57e4ec')
md5sums_i686=('947e7f3c8d1d63109d8d6a7fb70bfedb'
              'SKIP'
              '24f44d5a881b94daf48775213a57e4ec')

noextract=("http://www.xnview.com/beta/XnView-archx32.gz"
           "http://www.xnview.com/beta/XnView-archx64.gz")



package() {
  install -d -m755 "${pkgdir}/opt/${pkgname}"
  install -d -m755 "${pkgdir}/usr/bin"
  install -d -m755 "${pkgdir}/usr/share/applications"

  cp -a "${srcdir}/XnView"/* "${pkgdir}/opt/${pkgname}"
  ln -s "/opt/${pkgname}/xnview.sh" "${pkgdir}/usr/bin/${pkgname}"

  if [ "$CARCH" = "x86_64" ] ; then
      zcat "${srcdir}/XnView-archx64.gz" > "${pkgdir}/opt/${pkgname}/XnView"
  else
    zcat "${srcdir}/XnView-archx32.gz" > "${pkgdir}/opt/${pkgname}/XnView"
  fi

  install -m644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  install -D -m644 "${srcdir}/XnView/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}

# vim:set ts=2 sw=2 et:

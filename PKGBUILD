# Maintainer: Kevin Brodsky <corax26 'at' gmail 'dot' com>
# Contributor: Evan Penner <gryffyn@archlinux 'dot' net>
# Contributor: Iru Cai <mytbk920423\x40gmail 'dot' com>
# Contributor: Houlala <houlala 'at' gmail 'dot' com>
# Contributor: Olivier Duclos <olivier.duclos gmail.com>
# Contributor: wido <widomaker2k7@gmail.com>
# Contributor: VuDu <vudu 'dot' curse 'at' gmail 'dot' com>
# Contributor: Martin Poljak <martin 'at' poljak 'dot' cz>

pkgname=xnviewmp
pkgver=1.11.5
srcrel=1 # Incremented when there is a new release for the same version number
pkgrel=1
pkgdesc="An efficient multimedia viewer, browser and converter."
url="https://www.xnview.com/en/xnviewmp/"

arch=('x86_64')
license=('custom')
# Require qt5-multimedia to pull all its dependencies. We do not actually need
# to depend on qt5-*, but qt5-multimedia (and indirectly qt5-base) have
# various dependencies that we need even when using the packaged libraries.
depends=('qt5-multimedia')
optdepends=('glib2: support for moving files to trash')

source=("XnViewMP-linux-x64_${pkgver}-rel${srcrel}.tgz::https://download.xnview.com/old_versions/XnView_MP/XnView_MP-${pkgver}-linux-x64.tgz"
        'XnView.desktop')
sha256sums=('736c272f3007a59d9247fb6786f7a4d34d442386c1ceb262fae090261e96a9b7'
            'f6b3a4aaa0a55b5f21d9b91ab6f3da3d6ee077ba7fdd17e7c4ab1c69ad2a9e3a')

package() {
  install -d -m755 "${pkgdir}/opt/${pkgname}"
  install -d -m755 "${pkgdir}/usr/bin"
  install -d -m755 "${pkgdir}/usr/share/applications"

  cp -a "${srcdir}/XnView"/* "${pkgdir}/opt/${pkgname}"
  ln -s "/opt/${pkgname}/xnview.sh" "${pkgdir}/usr/bin/${pkgname}"

  install -m644 "${srcdir}/XnView.desktop" "${pkgdir}/usr/share/applications/XnView.desktop"
  install -D -m644 "${srcdir}/XnView/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Clean up
  rm "${pkgdir}/opt/${pkgname}/XnView.desktop"
  chmod 644 "${pkgdir}/opt/${pkgname}"/xnview*.png
  chmod 755 "${pkgdir}/opt/${pkgname}/XnView"
}

# vim:set ts=2 sw=2 et:

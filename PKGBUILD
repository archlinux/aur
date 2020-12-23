# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_pkgname=RSSOwlnix

pkgname=rssowlnix-bin
pkgver=2.8.0
pkgrel=1
pkgdesc="RSSOwlnix fork of RSSOwl"
arch=('x86_64')
url="https://github.com/Xyrio/RSSOwlnix"
license=('EPL')
depends=(
  'java-runtime>=8'
  # https://www.eclipse.org/swt/faq.php
  # Q: Which GTK version do I need to run SWT?
  # A: SWT requires the following GTK+ versions (or newer) to be installed:
  #    * ...
  #    * Eclipse/SWT 3.0.x - 3.5.x: GTK+ 2.2.1 and its dependencies
  #    * ...
  #
  # SWT version: ./plugins/org.eclipse.swt.gtk.linux.x86_64_3.108.0.v20180904-1901.jar
  'gtk2>=2.2.1'
  'webkit2gtk'
)
provides=('rssowl')
source=(
  "https://github.com/Xyrio/RSSOwlnix/releases/download/${pkgver}/RSSOwlnix-${pkgver//./-}-linux.gtk.x86_64.zip"
  "${_pkgname}.desktop"
)
sha256sums=(
  'ccc20f1ca9f4b9fac8d922913311e5d93d69e9de5838162ed6c4825c51e17aca'
  '63e631d213b69f2080c9ded859846b5ca3bf826ce38cb134842d54ce35508ae3'
)

package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/share/pixmaps"

  cp -r "${_pkgname}" "${pkgdir}/usr/share/"

  ln -s "/usr/share/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  ln -s "/usr/share/${_pkgname}/icon.xpm" "${pkgdir}/usr/share/pixmaps/${_pkgname}.xpm"

  install -D -m644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}

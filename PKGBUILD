# Maintainer: Jove Yu <yushijun110@126.com>
# Contribuor: luosoy <249799588@qq.com>
pkgname=com.qq.weixin.deepin
_appname=WeChat
_pkgname="Deepin-${_appname}"
pkgver=3.9.7deepin8
pkgrel=1
pkgdesc="Deepin Wine WeChat"
arch=('x86_64')
url="http://pc.weixin.qq.com/"
_imdevurl="https://deepin-wine.i-m.dev/"
license=('LicenseRef-Proprietary')
depends=(
  'deepin-wine8-stable'
  'deepin-wine-helper'
  'hicolor-icon-theme'
  'xdg-utils'
  'libldap24'
  'lib32-gnutls'
  'wqy-microhei'
)
conflicts=(
  'deepin-wine-wechat'
  'com.qq.weixin.spark'
)
install="${pkgname}.install"
source=(
  "${pkgname}-${pkgver}.deb::https://community-store-packages.deepin.com/appstore/pool/appstore/c/${pkgname}/${pkgname}_${pkgver}_amd64.deb"
  "${pkgname}.install"
  "${pkgname}.sh"
)
sha256sums=('d348e13d4cf0ca01f80eded4853e9e4ce0b1c4c1f0a20d5cfac03d87f854256a'
            '9fc08b3f39ab99a3335449f6ea69aff4bb67d8b4dd2b243009738369af544201'
            'f82382fc63eb5e100c75bb49dc1041ca873f38236a045e98288c91d8dd29279a')
package() {
  sed "s|@bottlename@|${_pkgname}|g" -i "${srcdir}/${pkgname}.install"
  sed -e "s|@bottlename@|${_pkgname}|g" \
      -e "s|@appver@|${pkgver}|g" \
      -e "s|@appname@|${_appname}|g" \
      -e "s|@pkgname@|${pkgname}|g" \
      -i "${srcdir}/${pkgname}.sh"
  bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
  sed "s|\"/opt/apps/${pkgname}/files/run.sh\"|${pkgname}|g;s|=chat;|=Network;|g" -i "${pkgdir}/opt/apps/${pkgname}/entries/applications/${pkgname}.desktop"
  install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 "${pkgdir}/opt/apps/${pkgname}/entries/applications/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm644 "${pkgdir}/opt/apps/${pkgname}/entries/icons/hicolor/48x48/apps/${pkgname}.svg" -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
}
# Maintainer: Tony G. <aur at tonyskapunk dot net>

pkgname='scaleft-url-handler'
pkgdesc='ScaleFT(TM) URL handler'
pkgver=1.52.2
pkgrel=1
arch=('any')
url="https://scaleft.com"
license=('custom')
depends=('scaleft-client-tools-bin' 'python')
source=("https://pkg.scaleft.com/rpm/${pkgname}-${pkgver}-${pkgrel}.noarch.rpm")
sha256sums=('f8a2f3451a631f4bc1585fc64bd33f43a2696af86a8e47d89e234d516d6c66d5')

prepare() {
  # patch code to force it to use python2.7
  sed -i 's/python$/python2.7/' usr/bin/scaleft-url-handler
}

package() {
  install -dm0755 ${pkgdir}/usr/lib/python2.7/site-packages/scaleft_url_handler-${pkgver}.egg-info
  install -m0644 usr/local/lib/python2.7/dist-packages/scaleft_url_handler-${pkgver}.egg-info/* \
                 -t ${pkgdir}/usr/lib/python2.7/site-packages/scaleft_url_handler-${pkgver}.egg-info 
  install -Dm0755 usr/bin/scaleft-url-handler ${pkgdir}/usr/bin/scaleft-url-handler
  install -Dm0644 usr/share/applications/scaleft-handler.desktop \
                  ${pkgdir}/usr/share/applications/scaleft-handler.desktop
}

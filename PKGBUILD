# Maintainer: Tony G. <aur at tonyskapunk dot net>

pkgname='scaleft-url-handler'
pkgdesc='ScaleFT(TM) URL handler'
pkgver=1.80.1
pkgrel=1
arch=('x86_64')
url="https://scaleft.com"
license=('custom')
depends=('scaleft-client-tools-bin' 'python')
source=("https://dist.scaleft.com/repos/rpm/stable/centos/9/${arch}/${pkgver}/${pkgname}-${pkgver}-${pkgrel}.noarch.rpm")
sha256sums=('bd2ea3cfed81a5f589b76fac6efc7b17915ece1115965bc6fa514bbdefb00ce4')

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

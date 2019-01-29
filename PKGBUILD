# Maintainer: Tony G. <aur at tonyskapunk dot net>

pkgname='scaleft-url-handler'
pkgdesc='ScaleFT(TM) URL handler'
pkgver=1.38.5
pkgrel=1
arch=('any')
url="https://scaleft.com"
license=('custom')
depends=('scaleft-client-tools' 'python2')
source=("https://pkg.scaleft.com/rpm/${pkgname}-${pkgver}-${pkgrel}.noarch.rpm")
sha256sums=('c90f1a19c5ca7e3655d979c321f439ef05b0c7d5b1d7ee9e41fdcb21b7134fe3')

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

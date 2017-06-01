# Maintainer: Tony G. <aur at tonyskapunk dot net>

pkgname='scaleft-url-handler'
pkgdesc='ScaleFT(TM) URL handler'
pkgver=1.26.2
pkgrel=1
arch=('any')
url="https://scaleft.com"
license=('custom')
makedepends=('rpmextract')
depends=('scaleft-client-tools' 'python2')
source=("https://pkg.scaleft.com/rpm/${pkgname}-${pkgver}-${pkgrel}.noarch.rpm")
sha256sums=('aeac3a0ac395fdb7ca0ea6c8cc91780b4b77db6ed05202951cff03f6ffed7a38')

prepare() {
	rpmextract.sh ${pkgname}-${pkgver}-${pkgrel}.noarch.rpm
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

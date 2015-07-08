# $Id: PKGBUILD 63943 2010-01-19 05:06:17Z eric $
# Contributor: J. Berger <jeberger@free.fr>

pkgname=quicklook
pkgver=1.2
_commit=0176bff4d357
pkgrel=2
pkgdesc="Collects system statistics and outputs pretty graphics and (X)HTML pages."
arch=('any')
url="http://code.google.com/p/quicklook/"
license=('GPL')
depends=('python2>=2.3' 'python2-cheetah' 'rrdtool')
source=(${pkgname}-${pkgver}.tar.gz::https://bitbucket.org/jmb/quicklook/get/v${pkgver}.tar.gz
        quicklook.cron)
md5sums=('bed76c1d9eeb30008eb2c0c6b39694d0'
         '92e2f9514865de7ad8fadb7ab9da5164')

package() {
   cd "${srcdir}/jmb-${pkgname}-${_commit}"

   make DESTDIR="${pkgdir}/opt/quicklook" install || return 1
   install -d "${pkgdir}/etc/cron.d" || return 1
   install -o root -m 644 "${srcdir}/quicklook.cron" "${pkgdir}/etc/cron.d/quicklook"
}

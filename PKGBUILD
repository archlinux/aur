# Maintainer: Erhan SAHIN <erhan@ssahin.net>

pkgname="horizon-icehouse"
pkgver=2014.1.3
_pkgname=horizon
_relname=icehouse
pkgrel=1
install=horizon.install
pkgdesc="Openstack dashboard"
arch=("i686" "x86_64")
url="http://www.launchpad.net/horizon/"
license=("Apache")

depends=('python2-django-icehouse>=1.4'
         'python2-django-icehouse<1.7'
         'python2-django-compressor>=1.3'
         'python2-django-openstack-auth>=1.1.4'
         'python2-eventlet>=0.13.0'
         'python2-iso8601>=0.1.9'
         'python2-kombu>=2.4.8'
         'python2-lesscpy>=0.9j'
         'python2-lockfile>=0.8'
         'python2-netaddr>=0.7.6'
         'python2-pbr>=0.6'
         'python2-pbr<1.0'
         'python2-ceilometerclient>=1.0.6'
         'python2-cinderclient>=1.0.6'
         'python2-glanceclient-openstack>=0.9.0'
         'python2-heatclient>=0.2.3'
         'python2-keystoneclient>=0.7.0'
         'python2-neutronclient>=2.3.4'
         'python2-neutronclient<3.0'
         'python2-novaclient>=2.17.0'
         'python2-swiftclient>=1.6'
         'python2-troveclient-openstack>=1.0.3'
         'python2-pytz>=2010h'
         'python2-six>=1.6.0')

makedepends=("python2-setuptools")
conflicts=("horizon", "openstack-horizon-git", "horizon-havana")
source=("https://launchpad.net/${_pkgname}/${_relname}/${pkgver}/+download/${_pkgname}-${pkgver}.tar.gz"
	"openstack-dashboard.conf")
md5sums=('c11199729bf82292ef700f55c788042d'
         '1d35d3120c3b1a1c41e1ca18207f5245')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}/"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}/"
  mkdir "${pkgdir}/usr/"
  mkdir "${pkgdir}/usr/share/"
  cp -a "./build/lib" "${pkgdir}/usr/share/openstack-dashboard"
  cp "${pkgdir}/usr/share/openstack-dashboard/openstack_dashboard/local/local_settings.py.example" "${pkgdir}/usr/share/openstack-dashboard/openstack_dashboard/local/local_settings.py"
  install -d -m 0755 "${pkgdir}"/etc/httpd/conf/extra/
  install -m 644 ${srcdir}/openstack-dashboard.conf ${pkgdir}/etc/httpd/conf/extra/openstack-dashboard.conf
}

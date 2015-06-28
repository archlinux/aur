# Maintainer: Erhan SAHIN <erhan@ssahin.net>

pkgname="horizon-kilo"
pkgver=2015.1.0
pkgrel=2
install=horizon.install
pkgdesc="Openstack dashboard"
arch=("i686" "x86_64")
url="http://www.launchpad.net/horizon/"
license=("Apache")
depends=('python2-pbr>=0.6'
         'python2-pbr<1.0'
         'python2-babel>=1.3'
         'python2-django-kilo'
         'python2-pint>=0.5'
         'python2-django-compressor>=1.4'
         'python2-django-openstack-auth>=1.1.7'
         'python2-django-openstack-auth<1.3.0'
         'python2-django-pyscss>=1.0.3'
         'python2-django-pyscss<2.0.0'
         'python2-eventlet>=0.16.1'
         'python2-httplib2>=0.7.5'
         'python2-iso8601>=0.1.9'
         'python2-kombu>=2.5.0'
         'python2-netaddr>=0.7.12'
         'python2-oslo-concurrency-kilo'
         'python2-oslo-config-kilo'
         'python2-oslo-i18n-kilo'
         'python2-oslo-serialization-kilo'
         'python2-oslo-utils-kilo'
         'python2-pyscss-kilo'
         'python2-ceilometerclient-kilo'
         'python2-cinderclient-kilo'
         'python2-glanceclient>=0.15.0'
         'python2-heatclient-kilo'
         'python2-keystoneclient-kilo'
         'python2-neutronclient-kilo'
         'python2-novaclient-kilo'
         'python2-saharaclient-kilo'
         'python2-swiftclient-kilo'
         'python2-troveclient-kilo'
         'python2-pytz>=2013.6'
         'python2-yaml>=3.1.0'
         'python2-six>=1.9.0'
         'python2-xstatic>=1.0.0'
         'python2-xstatic-angular>=1.3.7'
         'python2-xstatic-angular-bootstrap>=0.11.0.2'
         'python2-xstatic-angular-lrdragndrop>=1.0.2.2'
         'python2-xstatic-bootstrap-datepicker>=1.3.1.0'
         'python2-xstatic-bootstrap-scss>=3'
         'python2-xstatic-d3>=3.1.6.2'
         'python2-xstatic-hogan>=2.0.0.2'
         'python2-xstatic-font-awesome>=4.2.0'
         'python2-xstatic-jasmine>=2.1.2.0'
         'python2-xstatic-jquery>=1.7.2'
         'python2-xstatic-jquery-migrate>=1.2.1.1'
         'python2-xstatic-jquery.quicksearch>=2.0.3.1'
         'python2-xstatic-jquery.tablesorter>=2.0.5b.0'
         'python2-xstatic-jquery-ui>=1.10.1'
         'python2-xstatic-jsencrypt>=2.0.0.2'
         'python2-xstatic-magic-search>=0.2.0.1'
         'python2-xstatic-qunit>=1.14.0.2'
         'python2-xstatic-rickshaw>=1.5.0'
         'python2-xstatic-smart-table>=1.4.5.3'
         'python2-xstatic-spin>=1.2.5.2'
         'python2-xstatic-term.js>=0.0.4')
makedepends=("python2-setuptools")
conflicts=("horizon", "openstack-horizon-git", "horizon-icehouse")
source=("https://launchpad.net/horizon/kilo/${pkgver}/+download/horizon-${pkgver}.tar.gz"
	"openstack-dashboard.conf")
md5sums=('e4b1d2bd0b68b450b7b0fbc47dc90330'
         '1d35d3120c3b1a1c41e1ca18207f5245')

build() {
  cd "${srcdir}/horizon-${pkgver}/"
  python2 setup.py build
}

package() {
  cd "${srcdir}/horizon-${pkgver}/"
#  mkdir "${pkgdir}/usr/"
  mkdir -p "${pkgdir}/usr/share/openstack-dashboard"
  mkdir -p "${pkgdir}/usr/lib/python2.7/site-packages"
  cp -a "./build/lib/openstack_dashboard" "${pkgdir}/usr/share/openstack-dashboard/openstack_dashboard"
  cp -a "./build/lib/horizon" "${pkgdir}/usr/lib/python2.7/site-packages/horizon"
  cp -a "./horizon.egg-info" "${pkgdir}/usr/lib/python2.7/site-packages/horizon-${pkgver}-py2.7.egg-info"
  cp "${pkgdir}/usr/share/openstack-dashboard/openstack_dashboard/local/local_settings.py.example" "${pkgdir}/usr/share/openstack-dashboard/openstack_dashboard/local/local_settings.py"
  install -d -m 0755 "${pkgdir}"/etc/httpd/conf/extra/
  install -m 644 ${srcdir}/openstack-dashboard.conf ${pkgdir}/etc/httpd/conf/extra/openstack-dashboard.conf
}

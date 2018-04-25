# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Noel Kuntze <noel@familie-kuntze.de>

pkgname=pcs
pkgver=0.9.164
pkgrel=3
pkgdesc='pacemaker corosync shell utility for cluster configuration'
arch=('any')
url='http://clusterlabs.org/'
license=('GPL2')
depends=('pacemaker'
         'python'
         'python-pycurl'
         'python-lxml'
         'python-dateutil'
         'python-yaml'
         'python-urllib3'
         'python-simplejson'
         'ruby'
         'ruby-backports'
         'ruby-ethon'
         'ruby-ffi'
         'ruby-json'
         'ruby-multi_json'
         'ruby-open4'
         'ruby-rack'
         'ruby-rack-protection'
         'ruby-rack-test'
         'ruby-sinatra'
         'ruby-tilt'
         'ttf-liberation')
makedepends=('wget' 'python-setuptools' 'ruby-bundler' 'fontconfig')
source=("https://github.com/ClusterLabs/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('f5c26e470ace01e961f50ec6883d78e3556a572c274b7093005d496baed4fc33d38409169b06b67722b2fed32d5fd42cf8eb2b6832fe8e55027bf12a37dd5dc4')

prepare() {
  cd $pkgname-$pkgver
  sed -i -e 's,ethon-0.10.1,ethon-0.11.0,' pcsd/Makefile
  sed -i -e 's,ethon (0.10.1),ethon (0.11.0),' pcsd/Gemfile.lock
  sed -i -e 's,ffi-1.9.18,ffi-1.9.23,' pcsd/Makefile
  sed -i -e 's,ffi (1.9.18),ffi (1.9.23),' pcsd/Gemfile.lock
  sed -i -e 's,backports-3.9.1,backports-3.11.1,' pcsd/Makefile
  sed -i -e 's,backports (3.9.1),backports (3.11.1),' pcsd/Gemfile.lock
  sed -i -e 's,multi_json-1.12.2,multi_json-1.13.1,' pcsd/Makefile
  sed -i -e 's,multi_json (1.12.2),multi_json (1.13.1),' pcsd/Gemfile.lock
  sed -i -e 's,rack-1.6.4,rack-2.0.4,' pcsd/Makefile
  sed -i -e 's,rack (1.6.4),rack (2.0.4),' pcsd/Gemfile.lock
  sed -i -e 's,rack-protection-1.5.5,rack-protection-2.0.1,' pcsd/Makefile
  sed -i -e 's,rack-protection (1.5.5),rack-protection (2.0.1),' pcsd/Gemfile.lock
}

build() {
  cd $pkgname-$pkgver
# make -C pcsd BUILD_GEMS=true build_gems
}

package() {
  cd $pkgname-$pkgver
  make BUILD_GEMS=false DESTDIR="${pkgdir}" install install_pcsd
# make DESTDIR="${pkgdir}" install install_pcsd
  rm -fr "${pkgdir}/usr/bin"
  mv "${pkgdir}/usr/sbin" "${pkgdir}/usr/bin"
}

# vim: set sw=2 et:

# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Noel Kuntze <noel@familie-kuntze.de>

pkgname=pcs
pkgver=0.9.165
pkgrel=1
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
sha512sums=('dd39ce52842ea156cc989218b4d5dfd5a4bd39ef904678d42ad7dffa82cbea1a5887a0087dbe6f2ccb51580bf73cfa05b758f870be983876684c47d60124961b')

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
  make BUILD_GEMS=false SYSTEMCTL_OVERRIDE=true DESTDIR="${pkgdir}" install install_pcsd
# make DESTDIR="${pkgdir}" install install_pcsd
  rm -fr "${pkgdir}/usr/bin"
  mv "${pkgdir}/usr/sbin" "${pkgdir}/usr/bin"
}

# vim: set sw=2 et:

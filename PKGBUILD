# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Noel Kuntze <noel@familie-kuntze.de>

pkgname=pcs
pkgver=0.9.166
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
sha512sums=('afb1f6e95154fc0b20515d1317d07738c1fff4c90e32c3baa2b710ee0ba6aa1d01be477eb631bfbc740e2bdfff1535e6048c022ba3333395bc0f23d7d818334b')

prepare() {
  cd $pkgname-$pkgver
  sed -i -e 's,backports-3.11.3,backports-3.11.4,' pcsd/Makefile
  sed -i -e 's,backports (3.11.3),backports (3.11.4),' pcsd/Gemfile.lock
  sed -i -e 's,ethon-0.10.1,ethon-0.11.0,' pcsd/Makefile
  sed -i -e 's,ethon (0.10.1),ethon (0.11.0),' pcsd/Gemfile.lock
  sed -i -e 's,ffi-1.9.25,ffi-1.9.25,' pcsd/Makefile
  sed -i -e 's,ffi (1.9.25),ffi (1.9.25),' pcsd/Gemfile.lock
  sed -i -e 's,multi_json-1.12.2,multi_json-1.13.1,' pcsd/Makefile
  sed -i -e 's,multi_json (1.12.2),multi_json (1.13.1),' pcsd/Gemfile.lock
  sed -i -e 's,rack-1.6.10,rack-2.0.5,' pcsd/Makefile
  sed -i -e 's,rack (1.6.10),rack (2.0.5),' pcsd/Gemfile.lock
  sed -i -e 's,rack-protection-1.5.5,rack-protection-2.0.3,' pcsd/Makefile
  sed -i -e 's,rack-protection (1.5.5),rack-protection (2.0.3),' pcsd/Gemfile.lock
  sed -i -e 's,rack-test-0.7.0,rack-test-1.0.0,' pcsd/Makefile
  sed -i -e 's,rack-test (0.7.0),rack-test (1.0.0),' pcsd/Gemfile.lock
  sed -i -e 's,sinatra-1.4.8,sinatra-2.0.3,' pcsd/Makefile
  sed -i -e 's,sinatra (1.4.8),sinatra (2.0.3),' pcsd/Gemfile.lock
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

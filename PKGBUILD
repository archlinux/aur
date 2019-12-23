# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Noel Kuntze <noel@familie-kuntze.de>

pkgname=pcs
pkgver=0.10.4
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
         'ruby-open4'
         'ruby-rack'
         'ruby-rack-protection'
         'ruby-rack-test'
         'ruby-sinatra'
         'ruby-tilt'
         'ttf-liberation')
makedepends=('wget' 'python-setuptools' 'ruby-bundler' 'fontconfig')
source=("https://github.com/ClusterLabs/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('9a789ba2ab7ca4dc871e65a20837fdbc4254121c0f30658aee7eb8b69126c1701dddbe4cb994d1e1f7650d0c2449dd8e353ee04ba97eb715f0fab5c946c919b3')

prepare() {
  cd $pkgname-$pkgver
  sed -i -e 's,backports-3.11.4,backports-3.15.0,' pcsd/Makefile
  sed -i -e 's,backports (3.11.4),backports (3.15.0),' pcsd/Gemfile.lock
  sed -i -e 's,ethon-0.11.0,ethon-0.11.0,' pcsd/Makefile
  sed -i -e 's,ethon (0.11.0),ethon (0.11.0),' pcsd/Gemfile.lock
  sed -i -e 's,ffi-1.9.25,ffi-1.11.3,' pcsd/Makefile
  sed -i -e 's,ffi (1.9.25),ffi (1.11.3),' pcsd/Gemfile.lock
  sed -i -e 's,json-2.1.0,json-2.2.0,' pcsd/Makefile
  sed -i -e 's,json (2.1.0),json (2.2.0),' pcsd/Gemfile.lock
  sed -i -e 's,open4-1.3.4,open4-1.3.4,' pcsd/Makefile
  sed -i -e 's,open4 (1.3.4),open4 (1.3.4),' pcsd/Gemfile.lock
  sed -i -e 's,rack-2.0.6,rack-2.0.5,' pcsd/Makefile
  sed -i -e 's,rack (2.0.6),rack (2.0.5),' pcsd/Gemfile.lock
  sed -i -e 's,rack-protection-2.0.4,rack-protection-2.0.5,' pcsd/Makefile
  sed -i -e 's,rack-protection (2.0.4),rack-protection (2.0.5),' pcsd/Gemfile.lock
  sed -i -e 's,rack-test-1.1.0,rack-test-1.0.0,' pcsd/Makefile
  sed -i -e 's,rack-test (1.1.0),rack-test (1.0.0),' pcsd/Gemfile.lock
  sed -i -e 's,sinatra-2.0.4,sinatra-2.0.5,' pcsd/Makefile
  sed -i -e 's,sinatra (2.0.4),sinatra (2.0.5),' pcsd/Gemfile.lock
  sed -i -e 's,tilt-2.0.9,tilt-2.0.8,' pcsd/Makefile
  sed -i -e 's,tilt (2.0.9),tilt (2.0.8),' pcsd/Gemfile.lock
}

build() {
  cd $pkgname-$pkgver
# make -C pcsd BUILD_GEMS=true build_gems
}

package() {
  cd $pkgname-$pkgver
  make BUILD_GEMS=false SYSTEMCTL_OVERRIDE=true DESTDIR="${pkgdir}" install
# make DESTDIR="${pkgdir}" install install_pcsd
  rm -fr "${pkgdir}/usr/bin"
  mv "${pkgdir}/usr/sbin" "${pkgdir}/usr/bin"
}

# vim: set sw=2 et:

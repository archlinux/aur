# Maintainer: omgold@aur
# Contributor: Noel Kuntze <noel@familie-kuntze.de>
# COntributor: Brian Bidulock <bidulock@openss7.org>

pkgname=pcs
pkgver=0.11.7
pkgrel=1
pkgdesc='pacemaker corosync shell utility for cluster configuration'
arch=('any')
url='http://clusterlabs.org/'
license=('GPL2')
depends=('pacemaker'
         'python'
         'python-dacite'
         'python-pycurl'
         'python-lxml'
         'python-dateutil'
         'python-pyparsing'
         'python-tornado'
         'python-yaml'
         'python-urllib3'
         'python-simplejson'
         'ruby'
         'ttf-liberation')

makedepends=('wget' 'python-setuptools' 'python-setuptools-scm' 'python-pip' 'ruby-bundler' 'fontconfig' 'ruby-bundler')
source=("git+https://github.com/ClusterLabs/$pkgname#tag=v$pkgver")
sha256sums=(SKIP)

prepare() {
    cd $pkgname
    ./autogen.sh
    ./configure --prefix=/usr --with-distro=fedora --enable-local-build
}

build() {
  cd $pkgname
  make
}

package() {
  cd $pkgname
  make DESTDIR="${pkgdir}" install
  rm -fr "${pkgdir}/usr/bin"
  mv "${pkgdir}/usr/sbin" "${pkgdir}/usr/bin"
}

# vim: set sw=2 et:

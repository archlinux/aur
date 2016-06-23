# Maintainer = rafaelsoaresbr <rafaelsoaresbr@gmail.com>
# Contributing: https://github.com/rafaelsoaresbr/pkgbuild
# Builds: https://gitlab.com/rafaelsoaresbr/pkgbuild/builds

# Contributor: Dis McCarthy <aurarch@sigkill.net>
# Contributor: Stephan Conrad <stephan.conrad@gmail.com

pkgname=kimchi
pkgver=2.1.0
pkgrel=2

pkgdesc="An HTML5 management interface for KVM"

arch=(any)

url="http://kimchi-project.github.io/kimchi/"

license=('LGPL2.1' 'APACHE')

groups=('kimchi-project')

depends=('bridge-utils'
         'dnsmasq'
         'ebtables'
         'ginger-base'
         'libguestfs'
         'libvirt-python'
         'nfs-utils'
         'novnc'
         'open-iscsi'
         'python2-configobj'
         'python2-ethtool'
         'python2-ipaddr'
         'python2-lxml'
         'python2-magic'
         'python2-ordereddict'
         'python2-paramiko'
         'python2-pillow'
         'python2-pyparted'
         'qemu'
         'spice-html5'
         'ttf-font-awesome'
         'ttf-opensans'
         'websockify'
         'wokd'
)

conflicts=('kimchi-git')

# User files that should be saved. They are kept as Pacnew and Pacsave Files
backup=('etc/wok/plugins.d/kimchi.conf')

source=("https://github.com/kimchi-project/${pkgname}/archive/${pkgver}.tar.gz")

sha256sums=('bd5fa7221c8e7671d221b435f5a29672b160b97e673de465da6342dcb556989f')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  #./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var PYTHON=/usr/bin/python3
  PYTHON=/usr/bin/python2 ./autogen.sh --system && make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make DESTDIR=$pkgdir install
}

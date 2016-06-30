# Maintainer=rafaelsoaresbr <rafaelsoaresbr@gmail.com>
# kimchi-git
# Contributing: https://github.com/rafaelsoaresbr/pkgbuild
# Builds: https://gitlab.com/rafaelsoaresbr/pkgbuild/builds
#pkgbase=()
pkgname=('kimchi-git')

# Version
pkgver=2.2.0.r0.g7b5be35
pkgrel=1
#epoch=

# Generic
pkgdesc="An HTML5 management interface for KVM"
arch=('any')
url="http://kimchi-project.github.io/kimchi/"
license=('AGPL2.1' 'Apache')
groups=('kimchi-project')

# Dependencies
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
         'wokd')
#optdepends=()
makedepends=('git')
#checkdepends=()

# Package Relations
provides=('kimchi')
conflicts=('kimchi')
#replaces=()

# Others
backup=('etc/wok/plugins.d/kimchi.conf')
#options=()
#install=
#changelog=

# Sources
source=('git+https://github.com/kimchi-project/kimchi.git')
#source_i686=("")
#source_x86_64=("")
#noextract=()
#validpgpkeys=()

# Integrity
#md5sums=()
#md5sums_i686=()
#md5sums_x86_64=()
#sha1sums=()
sha256sums=('SKIP')

pkgver() {
  cd $srcdir/kimchi
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $srcdir/kimchi
}

build() {
  cd $srcdir/kimchi
  PYTHON=/usr/bin/python2 ./autogen.sh --system && make
}

#check() {
#}

package() {
  cd $srcdir/kimchi
  make DESTDIR=$pkgdir install
  cd $pkgdir/etc/systemd/system/wokd.service.d
  sed s:wokd.service::g kimchi.conf > kimchi.conf.new
  mv kimchi.conf.new kimchi.conf
}

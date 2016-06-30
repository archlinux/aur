# Maintainer=rafaelsoaresbr <rafaelsoaresbr@gmail.com>
# ginger-git
# Contributing: https://github.com/rafaelsoaresbr/pkgbuild
# Builds: https://gitlab.com/rafaelsoaresbr/pkgbuild/builds
#pkgbase=()
pkgname=('ginger-git')

# Version
pkgver=2.2.0.r0.g2bf9e05
pkgrel=1
#epoch=

# Generic
pkgdesc="WoK plugin for host management"
arch=('any')
url="http://kimchi-project.github.io/ginger/"
license=('AGPL2.1' 'Apache')
groups=('kimchi-project')

# Dependencies
depends=('ginger-base'
         'hddtemp'
         'libuser'
         'lm_sensors'
         'python2-augeas'
         'python2-ethtool'
         'python2-ipaddr'
         'python2-magic'
         'python2-netaddr'
         'tuned'
         'dbus-glib'
         'wokd')
#optdepends=()
makedepends=('git')
#checkdepends=()

# Package Relations
provides=('ginger')
conflicts=('ginger')
#replaces=()

# Others
backup=('etc/wok/plugins.d/ginger.conf')
#options=()
#install=
#changelog=

# Sources
source=('git+https://github.com/kimchi-project/ginger.git' 'ginger-git.install')
#source_i686=("")
#source_x86_64=("")
#noextract=()
#validpgpkeys=()

# Integrity
#md5sums=()
#md5sums_i686=()
#md5sums_x86_64=()
#sha1sums=()
sha256sums=('SKIP'
            '32b5d6d0caa31542a0909bef826ef572e7fc0ac82d11ebd3667b508cb62f55aa')

pkgver() {
  cd $srcdir/ginger
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $srcdir/ginger
}

build() {
  cd $srcdir/ginger
  PYTHON=/usr/bin/python2 ./autogen.sh --system && make
}

#check() {
#}

package() {
  cd $srcdir/ginger
  make DESTDIR=$pkgdir install
  cd $pkgdir/etc/systemd/system/wokd.service.d
  sed s:wokd.service::g ginger.conf >> ginger.conf.new
  mv ginger.conf.new ginger.conf
}

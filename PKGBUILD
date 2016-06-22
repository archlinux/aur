# Maintainer=rafaelsoaresbr <rafaelsoaresbr@gmail.com>
# ginger-git
# Contributing: https://github.com/rafaelsoaresbr/ginger-git.git
# Builds: https://gitlab.com/rafaelsoaresbr/ginger-git/builds
#pkgbase=()
pkgname=('ginger-git')

# Version
pkgver=2.1.0.r153.g63b5258
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
         'wok')
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
            '5f66fd556907c8d3bf917742ced53cc198b03c579dd0f0870859f2db81f63684')

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
}

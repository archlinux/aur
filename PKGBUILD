# Maintainer=rafaelsoaresbr <rafaelsoaresbr@gmail.com>
# wok-git
# Contributing: https://github.com/rafaelsoaresbr/wok-git.git
# Builds: https://gitlab.com/rafaelsoaresbr/wok-git/builds
#pkgbase=()
pkgname=('wok-git')

# Version
pkgver=2.1.0.r77.ga9986f5
pkgrel=1
#epoch=

# Generic
pkgdesc="Webserver of Kimchi - a cherrypy framework for multi-purpose plug-ins"
arch=('any')
url="http://kimchi-project.github.io/wok/"
license=('AGPL2.1' 'Apache')
groups=('kimchi-project')

# Dependencies
depends=('python2-cherrypy'
         'python2-cheetah'
         'python2-pam'
         'python2-m2crypto'
         'python2-jsonschema'
         'python2-psutil'
         'python2-ldap'
         'python2-lxml'
         'nginx'
         'openssl'
         'logrotate')
optdepends=('python2-ordereddict')
makedepends=('git')
#checkdepends=()

# Package Relations
provides=('wok')
conflicts=('wok')
#replaces=()

# Others
#backup=()
#options=()
#install=
#changelog=

# Sources
source=('git+https://github.com/kimchi-project/wok.git' 'python.patch')
#source_i686=("")
#source_x86_64=("")
#noextract=()
#validpgpkeys=()

# Integrity
#md5sums=()
#md5sums_i686=()
#md5sums_x86_64=()
#sha1sums=()
sha256sums=('SKIP' '808dcc04b66dd241eb1c434f75221e1c3762f65ed5beec77407bd123b965ee62')

pkgver() {
  cd $srcdir/wok
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $srcdir/wok
  patch -p1 <../python.patch
}

build() {
  cd $srcdir/wok
  PYTHON=/usr/bin/python2 ./autogen.sh --system && make
}

#check() {
#}

package_wok-git() {
  cd $srcdir/wok
  make DESTDIR=$pkgdir install
}

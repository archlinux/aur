# Maintainer=rafaelsoaresbr <rafaelsoaresbr@gmail.com>
# wokd
# Contributing: https://github.com/rafaelsoaresbr/pkgbuild
# Builds: https://gitlab.com/rafaelsoaresbr/pkgbuild/builds
#pkgbase=()
pkgname=('wokd')

# Version
pkgver=2.2.0
pkgrel=1
#epoch=

# Generic
pkgdesc="Webserver of Kimchi - a cherrypy framework for multi-purpose plug-ins"
arch=('any')
url="http://kimchi-project.github.io/wok/"
license=('AGPL2.1' 'Apache')
groups=('kimchi-project')

# Dependencies
depends=('logrotate'
         'nginx'
         'openssl'
         'python2-cherrypy'
         'python2-cheetah'
         'python2-jsonschema'
         'python2-ldap'
         'python2-lxml'
         'python2-m2crypto'
         'python2-ordereddict'
         'python2-psutil'
         'pypam2-bzr'
         'ttf-font-awesome'
         'ttf-opensans')
#optdepends=()
makedepends=('git')
#checkdepends=()

# Package Relations
#provides=()
conflicts=('wokd-git')
#replaces=()

# Others
backup=('etc/wok/wok.conf')
#options=()
install=wokd.install
#changelog=

# Sources
source=('https://github.com/kimchi-project/wok/archive/'${pkgver}'.tar.gz' 'python.patch' 'wokd.install')
#source_i686=("")
#source_x86_64=("")
#noextract=()
#validpgpkeys=()

# Integrity
#md5sums=()
#md5sums_i686=()
#md5sums_x86_64=()
#sha1sums=()
sha256sums=('c75d0d7018bef12b31df270cc4ee22d19eec6790291c44f7e993e7f39eadabf2'
            '808dcc04b66dd241eb1c434f75221e1c3762f65ed5beec77407bd123b965ee62'
            '21df69251ab787c5c0601bcf6d84fcd2836ad2080b0d6600c817dd290286eb1f')

#pkgver() {
#}

prepare() {
  cd "$srcdir/wok-${pkgver}"
  patch -p1 <../python.patch
}

build() {
  cd "$srcdir/wok-${pkgver}"
  PYTHON=/usr/bin/python2 ./autogen.sh --system && make
}

#check() {
#}

package () {
  cd "$srcdir/wok-${pkgver}"
  make DESTDIR=$pkgdir install
}

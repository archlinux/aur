# Maintainer: youngunix <zagazaw2004 () gmail ()>
# {former}Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: eht16 <enrico.troeger@uvena.de>
# Contributor: Addict7 <nicolasfloquet@gmail.com>

pkgname=geany-plugins-git
pkgver=1.31.0.r17.g59118d86
pkgrel=1
pkgdesc='Various plugins for Geany'
arch=('x86_64' 'i686')
url='http://plugins.geany.org/'
license=('GPL')
depends=('geany-git' 'vte' 'lua' 'ctpl' 'gpgme' 'gtkspell' 'hicolor-icon-theme')
makedepends=('git' 'libtool' 'python' 'gpgme' 'ctpl' 'lua' 'intltool')
optdepends=('hspell: hebrew spell checker')
provides=('geany-plugins')
conflicts=('geany-plugins-svn' 'geany-plugins')
source=('git+https://github.com/geany/geany-plugins.git')
md5sums=('SKIP')

pkgver() {
  cd geany-plugins
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd geany-plugins
  ./autogen.sh
  ./configure --prefix=/usr --disable-geanypy
  make build
}

package() {
  cd geany-plugins
  make install DESTDIR="$pkgdir"
}

# vim:set ts=2 sw=2 et:

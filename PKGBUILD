# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: eht16 <enrico.troeger@uvena.de>
# Contributor: Addict7 <nicolasfloquet@gmail.com>

pkgname=geany-plugins-git
pkgver=1.24.213.gc12f0d3
pkgrel=1
pkgdesc='Various plugins for Geany'
arch=('x86_64' 'i686')
url='http://plugins.geany.org/'
license=('GPL')
depends=('geany-git' 'vte' 'lua' 'libwebkit' 'ctpl' 'gpgme' 'gtkspell' 'hicolor-icon-theme')
makedepends=('git' 'libtool' 'python' 'gpgme' 'ctpl' 'lua' 'intltool' 'vala')
optdepends=('hspell: hebrew spell checker')
install="$pkgname.install"
provides=('geany-plugins')
conflicts=('geany-plugins-svn' 'geany-plugins')
source=('geany-plugins::git://github.com/geany/geany-plugins.git')
md5sums=('SKIP')

# These plugins does not build. Skipping until upstream makes them compile.
_skip='geanygendoc,geanyprj,projectorganizer'

pkgver() {
  cd geany-plugins
  git describe --tags | sed 's/-/./g'
}

prepare() {
  # Fix a problem with the waf script
  sed 's/revision > 0/revision != ""/g' -i geany-plugins/wscript
}

build() {
  cd geany-plugins
  ./waf configure --skip-plugins=$_skip
  ./waf build
}

package() {
  cd geany-plugins
  ./waf install --destdir="$pkgdir"
}

# vim:set ts=2 sw=2 et:

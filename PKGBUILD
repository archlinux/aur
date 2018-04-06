# Maintainer: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>
# {former}Maintainer: youngunix <zagazaw2004 () gmail ()>
# {former}Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: eht16 <enrico.troeger@uvena.de>
# Contributor: Addict7 <nicolasfloquet@gmail.com>

pkgname=geany-plugins-git
pkgver=1.33.0.r46.gfe6cb3d0
pkgrel=1
pkgdesc='Various plugins for Geany'
arch=('x86_64' 'i686')
url='https://plugins.geany.org/'
license=('GPL')
depends=('geany-git' 'vte-legacy' 'lua' 'ctpl' 'gpgme' 'gtkspell' 'hicolor-icon-theme')
makedepends=('git' 'libtool' 'python' 'gpgme' 'ctpl' 'lua' 'gtkspell' 'intltool')
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

  # To enable "spellcheck", first execute:
  #     sudo ln -s /usr/lib/pkgconfig/enchant-2.pc /usr/lib/pkgconfig/enchant.pc

  ./configure --prefix=/usr --disable-geanypy #--disable-spellcheck
  make build
}

package() {
  cd geany-plugins
  make install DESTDIR="$pkgdir"
}

# vim:set ts=2 sw=2 et:

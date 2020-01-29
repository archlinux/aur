# Maintainer: Frederic Bezies < fredbezies at gmail dot com > 
# Based on astromenace-svn by Archadept

pkgname=astromenace-git
_pkgname=astromenace
pkgver=v1.4.1.r23.g647f9017
pkgrel=2
pkgdesc="The latest version of hardcore 3D space shooter with spaceship upgrade possibilities - git version"
arch=('x86_64')
url="http://www.viewizard.com/astromenace/index_linux.php"
license=('GPL3')
conflicts=('astromenace' 'astromenace-svn')
depends=('sdl2' 'freealut'  'libvorbis'  'glu'  'freetype2')
makedepends=('git' 'cmake')
source=(git+https://github.com/viewizard/astromenace.git
'astromenace.desktop')
sha256sums=('SKIP'
            'cb7728e4e38b09324a1a49520aa5ee3ecaba4526ee2877dcde56753abcd06707')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  
  [[ -d build ]] && rm -r build
    mkdir build && cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DDATADIR=/usr/share/astromenace
    make
}

package () {
  cd "$srcdir/$_pkgname"
   install -Dm755 build/astromenace $pkgdir/usr/bin/astromenace
   install -Dm644 build/gamedata.vfs $pkgdir/usr/share/astromenace/gamedata.vfs
   install -Dm644 share/astromenace_128.png $pkgdir/usr/share/pixmaps/astromenace.png
    install -Dm644 share/astromenace.desktop $pkgdir/usr/share/applications/astromenace.desktop
    install -Dm644 share/astromenace.appdata.xml $pkgdir/usr/share/appdata/astromenace.appdata.xml
}

# Maintainer: Corey Mwamba <contact.me@coreymwamba.co.uk>
pkgname=jwm-git
pkgver=s1102
pkgrel=1
pkgdesc="JWM is a light-weight window manager for the X11 Window System. Git version."
arch=('i686' 'x86_64')
url="http://joewing.net/projects/jwm/"
license=('GPL')
groups=('x11')
license=('GPL2')
provides=('jwm')
conflicts=('jwm' 'jwm-snapshot' 'jwm-flashfixed' 'jwm-snapshot-lite')
depends=('fribidi' 'librsvg'  'libxinerama' 'libxmu' 'libxext' 'libpng' 'libx11' 'libxft' 'libjpeg>=7' 'libxpm')
makedepends=('git')
source=('git://github.com/joewing/jwm.git')
md5sums=('SKIP') 
_gitname=jwm

pkgver() {
  cd $_gitname
  # Use the tag of the last commit
  git describe --always | sed 's|-|.|g'
}


build() {
  cd "$srcdir/$_gitname/"
  autoreconf 
  ./configure prefix=/usr --sysconfdir=/etc 
  # --disable-icons         disable icon support
  #--disable-png           disable PNG images
  #--disable-cairo         disable Cairo support
  #--disable-rsvg          disable rsvg support
  #--disable-jpeg          disable JPEG images
  #--disable-xft           disable Xft
  #--disable-xrender       disable XRender
  #--disable-fribidi       disable bi-directional unicode support
  #--disable-xpm           disable XPM images
  #--disable-shape         disable use of the X shape extension
  #--disable-xmu           disable Xmu support
  #--disable-xinerama      disable Xinerama support
  #--disable-nls           do not use Native Language Support
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" install
}

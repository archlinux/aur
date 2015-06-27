# Maintainer: procrastinator
pkgname=gyazo-git
pkgver=1.0
pkgrel=1
pkgdesc="Launch the Gyazo app and drag your mouse to grab the screen."
arch=('any')
url="http://gyazo.com"
license=('GPL')
groups=(multimedia)
depends=('ruby' 'xclip' 'imagemagick')
makedepends=('git')
conflicts=('gyazo')

_gitremote="https://github.com/gyazo/Gyazo-for-Linux.git"
_gitname="Gyazo-for-Linux"

build() {
  cd "$srcdir"
  if [ -d $_gitname ] ; then
    git pull origin
    msg "Local repository updated."
  else
    git clone $_gitremote $_gitname
  fi
}

package() {
  install -D -m755 "$srcdir/$_gitname/src/gyazo.rb" "$pkgdir/usr/bin/gyazo"
  install -D -m664 "$srcdir/$_gitname/src/gyazo.desktop" "$pkgdir/usr/share/applications/gyazo.desktop"
  install -D -m644 "$srcdir/$_gitname/icons/gyazo.png" "$pkgdir/usr/share/pixmaps/gyazo.png"

} 


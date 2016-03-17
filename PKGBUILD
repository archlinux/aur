# Maintainer ugjka <ugis.germanis@gmail.com>
# Contributor: Bill Sun <billksun@gmail.com>
# Contributor magnific0
pkgname=wondershaper-git
pkgver=20130114
pkgrel=1
pkgdesc="network adapter bandwidth limiter"
arch=('x86_64' 'i686')
url="https://github.com/magnific0/wondershaper.git"
license=('GPL2')
depends=('iproute')
_gitroot="git://github.com/magnific0/wondershaper.git"
_gitname="wondershaper"

build() {
  cd "$srcdir"

  msg "Connecting to the git repository..."
  if [ -d "$srcdir/$_gitname" ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  cd "$srcdir"
  rm -rf $_gitname-build
  git clone $_gitname $_gitname-build
  cd $_gitname-build
 
  make
  
}

package() {
  cd $_gitname-build

  install -Dm755 wondershaper "$pkgdir/usr/bin/wondershaper"
   
}

# vim:set ts=2 sw=2 et:

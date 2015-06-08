# Maintainer: Daniel T. Borelli < daltomi at aol >

pkgname=mpd_notifyd
pkgver=0.16
pkgrel=1
pkgdesc="Notifier daemon type for MPD using libnotify.
        The start of reproduction is reported."
arch=('i686' 'x86_64')
url='https://bitbucket.org/daltomi/mpd_notifyd'
license=('GPL2')
depends=('gtk2' 'libnotify' 'libmpd')
makedepends=('git' 'cmake')
_gitroot=$url.git
_gitname='mpd_notifyd'

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" --depth=1 --single-branch "$_gitname"
  fi

  msg "GIT checkout done or server timeout"

  src_git=$srcdir/$_gitname/

#Build  
  msg "Starting build..."
  cd $src_git/
  cmake -DCMAKE_BUILD_TYPE="Release" . && make 
}

package() {
  install -Dm755 "$srcdir/$_gitname/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

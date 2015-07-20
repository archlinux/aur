pkgname=astrapiremoted
pkgver=1.0.0
pkgrel=4
pkgdesc='Daemon for Astrapi Remote'
url='http://www.astrapi.de/'
license=('custom:GPL')
arch=("i686" "x86_64")
makedepends=('git')
provides=('astrapiremoted')

_gitroot=git@bitbucket.org:astrapi/linux.daemon.astrapi.remote.git
_gitname=linux.daemon.astrapi.remote

build() {
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  cd "$srcdir/$_gitname"

  ./autogen.sh
  make
}

package() {
install -d "$pkgdir/opt"
cp -R "$srcdir/opt" "$pkgdir/opt/astrapi"

#  mkdir -p /opt/astrapi/bin
#  mkdir -p /opt/astrapi/etc
#  mkdir -p /opt/astrapi/log
}

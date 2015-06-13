pkgname=nd-git
pkgver=20110401
pkgrel=1
pkgdesc="A network diagnostics utility"
arch=('i686' 'x86_64')
url="https://github.com/benruijl/nd"
license=('GPLv3')
depends=('iproute2' 'dnsutils' 'diffutils')
makedepends=('git')

_gitroot="git://github.com/benruijl/nd.git"
_gitname="nd"

build() {
  cd "$srcdir"

  msg "Connecting to GIT server...."

  if [ -d $_gitname ]; then
     cd $_gitname && git pull origin
     msg "The local files are updated."
  else
     git clone $_gitroot $_gitname
     cd $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting install..."

  install -D -m755 nd.sh $startdir/pkg/usr/bin/nd
}

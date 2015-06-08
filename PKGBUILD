# Maintainer : Daniel T. Borelli < daltomi@aol.com >
# Contributor: sekret
# Contributor: flu

pkgname=flvlc
pkgver=2.4.2
pkgrel=0
pkgdesc='FLTK media player by libvlc'
arch=('i686' 'x86_64')
#url="http://sourceforge.net/p/flvlc/"
url='https://bitbucket.org/daltomi/flvlc'
license=('GPL3')
depends=('fltk' 'vlc')
makedepends=('git' 'cmake')
options=('!buildflags')
_gitroot=$url.git
_gitname='flvlc'

prepare() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" --depth=1 --single-branch --branch "v.$pkgver" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
}

build() {
  local _src_git=$srcdir/$_gitname
  cd $_src_git
  cmake -DCMAKE_BUILD_TYPE=Release && make
}

package() {
  local _src_git=$srcdir/$_gitname
 install -Dm0755 $_src_git/flvlc "${pkgdir}/usr/bin/flvlc"
}

# vim:set ts=2 sw=2 et:

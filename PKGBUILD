pkgname=diacstuff
pkgver=20130328
pkgrel=2
pkgdesc="rglassd, rcollector for quaggas bgp"
arch=('i686' 'x86_64')
url="http://diac24.net"
license="GPL2"
depends=('libxml2')
makedepends=('git')
_gitroot='git://git.spaceboyz.net/diacstuff.git'
_gitname='diacstuff'

md5sums=()
	 
build() {
  cd $srcdir
  msg "Connecting to GIT server...."

  if [ -d "$_gitname" ] ; then
    cd "$_gitname"
    git checkout -- configure.ac
    git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cd "${srcdir}/${_gitname}"

  ./autogen.sh
  ./configure --prefix=/usr || return 1
  make
}
package() {
  cd "${srcdir}/${_gitname}"
  make DESTDIR="$pkgdir" install
}

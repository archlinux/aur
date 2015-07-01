# Contributor: petRUShka <petrushkin@yandex.ru>

pkgname=spnegohelp-git
pkgver=20120130
pkgrel=2
pkgdesc="SPNEGO helper for Apache2 mod_auth_gss_krb5 and Nginx mod-auth-kerb"
arch=('i686' 'x86_64')
url="https://github.com/petRUShka/spnegohelp"
license="GPL"
depends=()
source=()
md5sums=()
provides=(spnegohelp)
confilcts=(spnegohelp)

_gitroot="https://petRUShka@github.com/petRUShka/spnegohelp.git"
_gitname="spnegohelp"

build() {
  cd ${srcdir}
  msg "Connecting to GIT server...."

  if [ -d ${_gitname}/.git ] ; then
    cd ${_gitname}
    git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot} ${_gitname}
    cd ${_gitname}
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  make
}

package(){
  cd ${srcdir}/${_gitname}
  mkdir -p $pkgdir/usr/lib
  install -D -m 664 ${srcdir}/${_gitname}/libspnegohelp.so $pkgdir/usr/lib/libspnegohelp.so || return 1
  install -D -m 664 ${srcdir}/${_gitname}/libspnegohelp.a  $pkgdir/usr/lib/libspnegohelp.a  || return 1
}

_pkgname="python-pytmx"
pkgname="${_pkgname}"
pkgver="master"
pkgrel=1
pkgdesc="Python library to read Tiled Map Editor's TMX maps"
arch=('i686' 'x86_64')
url="https://github.com/bitcraft/PyTMX"
license=('LGPL v3')
depends=('python>=3.1' 'python-six')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_gitroot="https://github.com/bitcraft/PyTMX.git"
_gitname=("${_pkgname}")

build() {
  cd "${srcdir}"
  msg "Connecting to GIT server...."

  if [ -d ${_gitname} ] ; then
    cd ${_gitname} && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot} ${_gitname}
  fi

  msg "GIT checkout done or server timeout"
}

package(){
  cd ${_gitname}
  python setup.py install --root="$pkgdir" --prefix=/usr
}

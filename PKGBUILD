#Maintainer: M0Rf30

pkgname=newsoul-git
pkgver=142.119b876
pkgrel=1
pkgdesc="Museek+, a daemon/server based Soulseek client, resurrected."
arch=('i686' 'x86_64')
url="https://github.com/KenjiTakahashi/newsoul"
license=('GPL3')
depends=(
    'json-c'
    'libevent'
    'taglib'
    'nettle'
    'sqlite'
)
optdepends=('python2-crypto: some python utils')
makedepends=('python2' 'premake')
provides=('newsoul')
source=('newsoul::git+https://github.com/KenjiTakahashi/newsoul.git')

build() {
  cd newsoul/build
  premake4 gmake
  make newsoul
}

package(){
  cd newsoul/build
  premake4 --prefix="${pkgdir}" install

  cd ../python-bindings
  python2 setup.py install --root=${pkgdir}/ --optimize=1

  cd ../python-utils
  python2 setup.py install --root=${pkgdir}/ --optimize=1
}

pkgver() {
  cd newsoul
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

md5sums=('SKIP')

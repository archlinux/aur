# Maintainer: robertfoster

pkgname=newsoul-git
pkgver=146.178bcd1
pkgrel=1
pkgdesc="Museek+, a daemon/server based Soulseek client, resurrected."
arch=('x86_64')
url="https://github.com/KenjiTakahashi/newsoul"
license=('GPL-3.0-or-later')
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
conflicts=('newsoul')
source=('newsoul::git+https://github.com/KenjiTakahashi/newsoul.git')

build() {
  cd newsoul/build
  premake4 gmake
  make newsoul
}

package() {
  cd newsoul/build
  premake4 --prefix="${pkgdir}" install

  cd ../python-bindings
  python2 setup.py install --root="${pkgdir}/" --optimize=1

  cd ../python-utils
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}

pkgver() {
  cd newsoul
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

sha256sums=('SKIP')

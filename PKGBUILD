# Maintainer: Mihail G. <misho88@gmail.com>

pkgname=service6-git
pkgver=46.a36fcad
pkgrel=1
pkgdesc="user-friendy control of s6-rc"
arch=('any')
url="https://github.com/misho88/service6"
license=('GPL')
depends=('s6-rc' 'python-argcomplete' 'python-natsort' 'python-blessed')
makedepends=('make' 'git' 'w3m')
optdepends=('bash-completion')
provides=('service6')
conflicts=('service6')
source=('git+https://github.com/misho88/service6.git')
md5sums=('SKIP')


pkgver() {
  cd service6
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd service6
  git submodule update --init --recursive -j 2
}

package() {
  cd service6
  make all
  make DESTDIR=$pkgdir install
  install -D -m 644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

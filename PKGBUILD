# Maintainer: Andrew Shunick <aur at shunick dot info>
pkgname=python2-pachi_py-git
pkgver=r18.9cb949b
pkgrel=1
pkgdesc="Pachi (game of Go) environment for OpenAI gym"
arch=('any')
url="https://gym.openai.com/"
giturl="https://github.com/openai/pachi-py"
license=('GPLv2')
provides=('python2-pachi_py')
depends=('python2' 'python2-numpy')
makedepends=('python2-setuptools' 'gcc' 'cmake')
source=("${pkgname}::git+${giturl}")
sha512sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $pkgname
  patch -Np1 < ../../CMakeLists-fix.patch
}

package() {
  cd $pkgname
  env CC=gcc
  env CXX=gcc
  python2 setup.py install --root="$pkgdir/" --optimize=1
}


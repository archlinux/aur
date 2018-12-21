# Maintainer: DanManN <dnahimov@gmail.com>
# Python package author: Ines Montani <ines@explosion.ai>
pkgname=python-wasabi-git
_origpkgname=wasabi
pkgver=0.0.15.r96.4ff962b
pkgrel=2
pkgdesc="A lightweight console printing and formatting toolkit"
arch=("x86_64")
url="https://github.com/ines/wasabi"
license=("MIT")
depends=('python')
makedepends=("python-setuptools")
provides=('python-wasabi')
conflicts=('python-wasabi')
source=("git+https://github.com/ines/$_origpkgname.git")
md5sums=('SKIP')

prepare() {
  cd "$_origpkgname"
  git checkout $(curl https://api.github.com/repos/ines/$_origpkgname/releases/ | grep tag_name | cut -d '"' -f4 | head -n 1)
}

pkgver() {
  cd "$_origpkgname"
  printf "%s.r%s.%s" "$(cat wasabi/about.py | grep -i version | grep -v '#' | cut -d '"' -f2 | head -n 1)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_origpkgname"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

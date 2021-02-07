# Maintainer: Eshan Ramesh find me at esrh.sdf.org

pkgname=jrnl-git
_gitname=jrnl
pkgver=2.7.r11.gdc776b1
pkgrel=4
pkgdesc="Collect your thoughts and notes without leaving the command line"
arch=('any')
url="https://jrnl.sh/"
license=('GPL3')
depends=('python')
checkdepends=('python-behave')
makedepends=('git' 'python-dephell' 'python-setuptools')
conflicts=("jrnl")
source=("git+https://github.com/jrnl-org/jrnl.git")
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

check() {
  cd "$_gitname"
  behave
}

prepare() {
  cd "$_gitname"
  dephell deps convert --from pyproject.toml --to setup.py --envs main
}

build() {
  cd "$_gitname"
  python setup.py build
}

package() {
  cd "$_gitname"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}


# Maintainer: Lukas Jurk <ljurk@pm.me>
_pkgname=python-jiramenu
_gitname=jiramenu
pkgname=$_pkgname-git
pkgver=r1.0.3
pkgrel=1
pkgdesc="Dmenu/Rofi frontend for jira"

arch=('any')
url="https://gitlab.com/ljurk/jiramenu"
license=('GPLv3')
depends=('python')
makedepends=('git'
             'python')
optdepends=('dmenu: either dmenu or rofi is required'
            'rofi: either dmenu or rofi is required')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://gitlab.com/ljurk/$_gitname.git")
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  printf "r%s" "$(python setup.py --version)"
}
build() {
    cd "$_gitname"
    python setup.py build
}

package() {
    cd "$_gitname"
    python setup.py install --prefix="/usr" --root="${pkgdir}" --optimize=1 --skip-build
}

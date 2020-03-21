# Maintainer: Lukas Jurk <ljurk@pm.me>
_pkgname=python-jiramenu
_gitname=jiramenu
pkgname=$_pkgname-git
pkgver=r25.5997742
pkgrel=1
pkgdesc="Dmenu/Rofi frontend for jira"

arch=('any')
url="https://github.com/ljurk/jiramenu"
license=('GPLv3')
depends=('python')
makedepends=('git')
optdepends=('dmenu: either dmenu or rofi is required'
            'rofi: either dmenu or rofi is required')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git://github.com/ljurk/$_gitname.git")
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
    cd "$_gitname"
    python setup.py build
}

package() {
    cd "$_gitname"
    python setup.py install --prefix="/usr" --root="${pkgdir}" --optimize=1 --skip-build
}

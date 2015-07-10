pkgname=python2-jedi-git
_gitname=jedi
pkgver=3964.7b50bb0
pkgrel=1
pkgdesc="Jedi is an autocompletion tool for Python that can be used in IDEs/editors"
arch=(any)
url="https://github.com/davidhalter/jedi"
license=('MIT')
depends=('python2')
makedepends=('git' 'python2-distribute')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
source=('git://github.com/davidhalter/jedi.git')
# Because the sources are not static, skip Git checksum:
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  # Use the tag of the last commit
  #git describe --always | sed 's|-|.|g'
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
   cd $_gitname
   python2 setup.py install --root="${pkgdir}" --optimize=1 || exit 1
}
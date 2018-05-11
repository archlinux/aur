# Maintainer: Florian B. 

pkgname="powerline-shell"
pkgver=r546.73b01d6
pkgrel=1
pkgdesc="A pretty prompt for your shell"
arch=("any")
_giturl="://github.com/b-ryan/powerline-shell"
url="https${_giturl}"
license=("MIT")
provides=("${pkgname}")
depends=("python")
source=(
  "git${_giturl}.git"
  #${pkgname}-${pkgver}::${url}/archive/master.tar.gz"
)
md5sums=('SKIP')

pkgver() {
  cd "$(pkgname)"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}"
  mv "${pkgname}-master" "${pkgname}"
}

package() {
  cd "${srcdir}/${pkgname}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

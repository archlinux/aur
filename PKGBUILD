# Maintainer: Andrew Chen <andrew.chuanye.chen@gmail.com>

pkgname=jefferson-git
_gitname=jefferson
pkgver=0.2.r9.g78da2e6
pkgrel=1
pkgdesc="JFFS2 filesystem extraction tool"
url="https://github.com/sviehb/jefferson"
arch=('any')
license=('MIT')
depends=('python2' 'python2-cstruct' 'python2-pyliblzma')
makedepends=('git')
provides=('jefferson')
conflicts=('jefferson')
source=(git+https://github.com/sviehb/${_gitname}.git)
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  printf "%s.r%s.g%s" "$(python2 setup.py --version)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_gitname
  python2 setup.py build
}

package() {
  cd $_gitname
  python2 setup.py install -O1 --root="${pkgdir}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

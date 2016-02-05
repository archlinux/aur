# Maintainer: Fabien JUIF <fabien.juif@gmail.com>
application=himawaripy
pkgname=${application}-git
pkgrel=1
pkgver=r41.0364d54
pkgdesc="Put near-realtime picture of Earth as your desktop background."
url="https://github.com/boramalper/${application}"
arch=('x86_64' 'i686')
depends=('python' 'python-pillow')
makedepends=('git')
source=(
  "${application}::git+https://github.com/boramalper/${application}"
  "setup.py"
  "start"
)
sha256sums=(
  'SKIP'
  'acfd51c95e432263f00c6aa066535a71136f7e4c2204da1b4ab6fd49c4247a1f'
  '5df03e0ccddd3c03a61b993e55ad1132f3d361ff52945d7073e1ae20855ca92e'
)

prepare() {
  cd ${srcdir}/${application}
  sed -i 's/from utils/from himawaripy.utils/' himawaripy.py
}

package() {
  cd ${srcdir}
  python setup.py install --root="$pkgdir/" --optimize=1

  cd ${pkgdir}/usr/bin
  mv start ${application}
}

pkgver() {
  cd ${application}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# vim:set ts=2 sw=2 et:

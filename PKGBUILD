# Maintainer: Omar Ahmad <omar.squircleart@gmail.com>
pkgname=animation-nodes-git
pkgver=2.0.4.r4670.8ea9ef37
pkgrel=1
pkgdesc="Node based visual scripting system designed for motion graphics in Blender."
arch=('any')
url="https://github.com/JacquesLucke/animation_nodes"
license=('GPL')
depends=('blender' 'python-numpy')
makedepends=('sed' 'cython')
source=('git+https://github.com/JacquesLucke/animation_nodes.git#branch=master')
md5sums=('SKIP')

pkgver() {
  cd "animation_nodes"
  echo $(sed -n 's/ *"version":[^(]*(\([0-9]*\), \([0-9]*\), \([0-9]*\).*/\1.\2.\3/p' animation_nodes/__init__.py).r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}
prepare() {
  cd "animation_nodes"
  _blender_version=$(blender --version | grep -Po 'Blender \K[0-9]\...')
  echo addonsDirectory = r"'$pkgdir/usr/share/blender/$_blender_version/scripts/addons'" > config.default.py
}
package() {
  cd "animation_nodes"
  _blender_version=$(blender --version | grep -Po 'Blender \K[0-9]\...')
  mkdir -p ${pkgdir}/usr/share/blender/$_blender_version/scripts/addons
  python setup.py --all --noversioncheck
}

# Maintainer: Omar Ahmad <omar.squircleart@gmail.com>
pkgname=animation-nodes-git
pkgver=2.1.0.r4887.716e91c8
pkgrel=1.2
pkgdesc="Node based visual scripting system designed for motion graphics in Blender."
arch=('any')
url="https://github.com/JacquesLucke/animation_nodes"
license=('GPL')
depends=('blender' 'python-numpy')
makedepends=('sed' 'cython')
source=('git+https://github.com/JacquesLucke/animation_nodes.git#branch=v2.1')
md5sums=('SKIP')

pkgver() {
  cd "animation_nodes"
  echo $(sed -n 's/ *"version":[^(]*(\([0-9]*\), \([0-9]*\), \([0-9]*\).*/\1.\2.\3/p' animation_nodes/__init__.py).r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}
prepare() {
  cd "animation_nodes"
  _blender_version=$(blender --version | grep -Po 'Blender \K[0-9]\...')
  echo "{\"Copy Target\" : \"$pkgdir/usr/share/blender/$_blender_version/scripts/addons\"}" > conf.json
}
package() {
  cd "animation_nodes"
  _blender_version=$(blender --version | grep -Po 'Blender \K[0-9]\...')
  mkdir -p $pkgdir/usr/share/blender/$_blender_version/scripts/addons
  python setup.py build --force --copy --noversioncheck
}

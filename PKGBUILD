# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>

pkgname=blendercam-git
pkgver=r850.ad130df
pkgrel=1
pkgdesc="An open source solution for artistic CAM"
license=("GPL2")
arch=(any)
depends=('blender' 'python' 'python-equation' 'python-shapely' 'python-numpy' 'vtk')
url="http://blendercam.blogspot.com/"
install="blendercam-git.install"
source=("git+https://github.com/vilemnovak/blendercam.git")
md5sums=('SKIP')

pkgver() {
  cd blendercam
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $srcdir/blendercam
  blenderVer="$(blender -v | grep -oP '^Blender \K\d+\.\d+')"
  mkdir -p "$pkgdir/usr/share/blender/${blenderVer}/"
  cp -r scripts "$pkgdir/usr/share/blender/${blenderVer}/"
}

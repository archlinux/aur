# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
# original maintainer : Fabien Devaux <fdev31@gmail.com>

pkgname=blender-plugin-miratools
pkgver=r996.2999439 # commit-num.commit-hash 
pkgrel=1
pkgdesc="Modern modeling and retopology tools"
url="https://github.com/mifth/mifthtools/wiki/Mira-Tools"
license=("GPL")
arch=('any')
depends=('blender')
groups=('blender')
makedepends=('git')
source=("${pkgname}::git+https://github.com/mifth/mifthtools.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  _blender=$(pacman -Sddp --print-format %v blender|grep -oP '(?<=\:)[[:digit:]]+\.[[:digit:]]+(?=\.)')
  addons="$pkgdir/usr/share/blender/${_blender}/scripts/addons/"
  install -dm755 ${addons}/${name}
  cp -a ${srcdir}/${pkgname}/blender/addons/2.8/* ${addons}/${name}
}


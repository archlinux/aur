# Submitter: Fabien Devaux <fdev31@gmail.com>
# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>

name=retopoflow

pkgname=blender-plugin-${name}-git
pkgver=2.0.2.r172.g3d8b3a47
pkgrel=1
pkgdesc="A suite of retopology tools for Blender"
arch=('any')
url="https://blendermarket.com/products/retopoflow/"
license=('GPL')
depends=('blender')
makedepends=('git')
conflicts=('blender-plugin-retopoflow')
source=("git+https://github.com/CGCookie/retopoflow.git")
md5sums=('SKIP')

pkgver() {
  cd ${name}
  # cutting off 'v' prefix that presents in the git tag
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  _blender=$(pacman -Sddp --print-format %v blender|grep -oP '(?<=\:)[[:digit:]]+\.[[:digit:]]+(?=\.)')
  cd ${srcdir}
  addons="$pkgdir/usr/share/blender/${_blender}/scripts/addons"
  install -dm755 ${addons}/${name}
  cp -r ${name}/* ${addons}/${name}
}

# vim:set ts=2 sw=2 et:

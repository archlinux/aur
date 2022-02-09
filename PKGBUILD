# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>

name=yavne
version=1.3.0
#fragment="#commit=7e49329 "
files=(__init__.py operators.py panel.py preferences.py utils.py)

pkgname=blender-plugin-${name}
pkgver=1.3.0_r35.ef7c1a2
pkgrel=1
pkgdesc="This Blender addon provides a set of tools for editing vertex normals. Y.A.V.N.E. can dramatically improve the visual quality of a mesh without altering geometry."
arch=('any')
url="https://github.com/fedackb/yavne"
license=('GPL')
depends=('blender')
makedepends=('git')
source=("${name}::git+https://github.com/fedackb/yavne.git${fragment}")
md5sums=('SKIP')

pkgver() {
  cd ${name}
  printf "${version}_r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  _blender=$(pacman -Sddp --print-format %v blender|grep -oP '(?<=\:)[[:digit:]]+\.[[:digit:]]+(?=\.)')
  cd ${name}
  addons="$pkgdir/usr/share/blender/${_blender}/scripts/addons"
  install -dm755 ${addons}/${name}
  for file in  ${files[@]} ; do install -m 755 ${file} ${addons}/${name}/${file} ; done
#  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:

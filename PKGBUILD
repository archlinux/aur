# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>

name=bullet-constraints-builder
version=1.0
#fragment="#commit=7e49329 "
files=(__init__.py operators.py panel.py preferences.py utils.py)
_blender=$(pacman -Sddp --print-format %v blender|grep -oP '(?<=\:)[[:digit:]]{1}\.[[:digit:]]{2}(?=\.)')

pkgname=blender-plugin-${name}
pkgver=1.0_r277.2fd3735
pkgrel=1
pkgdesc="This Blender Add-on connect rigid bodies via constraints in a physical plausible way"
arch=('any')
url="https://github.com/KaiKostack/bullet-constraints-builder"
license=('GPL')
depends=('blender' 'python-sympy')
makedepends=('git')
source=("${name}::git+https://github.com/KaiKostack/${name}.git${fragment}")
md5sums=('SKIP')

pkgver() {
  cd ${name}
  printf "${version}_r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${name}
  addons="$pkgdir/usr/share/blender/${_blender}/scripts/addons"
  doc=${pkgdir}/usr/share/doc/blender-${name}
  share=${pkgdir}/usr/share/blender-${name}
  install -dm755 ${addons}
  install -dm755 ${doc}
  install -dm755 ${share}
  cp -a kk_bullet_constraints_builder ${addons}
  cp -a doc/* ${doc}
  cp -a examples ${share}
  #for file in  ${files[@]} ; do install -m 755 ${file} ${addons}/${name}/${file} ; done
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:

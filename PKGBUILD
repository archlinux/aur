# Maintainer: Shun Terabayashi <shunonymous@gmail.com>
_repo=blender_mmd_tools
pkgname=blender-plugin-mmd-tools-git
_version=0.4.4
pkgver=v2.8.0.r1.g2677cc2
pkgrel=1
pkgdesc="Blender addon for importing Models and Motions of MikuMikuDance."
arch=('i686' 'x86_64')
url="https://github.com/UuuNyaa/blender_mmd_tools"
license=('GPL3')
groups=('blender')
depends=('blender')
makedepends=('git')
source=("git+https://github.com/UuuNyaa/$_repo#branch=main")
md5sums=('SKIP')

pkgver() {
  cd "${_repo}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${_repo}"

  _blender_ver=$(blender -v | head -n1 | cut -f2 -d ' ')
  _addons_dir="${pkgdir}/usr/share/blender/${_blender_ver}/scripts/addons/"
  _addon_name="mmd_tools"

  install -dm755 ${_addons_dir}/${_addon_name}
  for file in `find ${_addon_name} -type f`
  do
    install -Dm755 $file ${_addons_dir}/${file}
  done
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:

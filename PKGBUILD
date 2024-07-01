# Maintainer: Vorschreibung <vorschreibung@gmail.com>
# shellcheck disable=SC2034,SC2164,SC2154

pkgname=blender-plugin-rtcw-et-model-tools-git
_pkgname=blender-plugin-rtcw-et-model-tools
pkgver=1.0.rc3.r20.g6396ff0
pkgrel=1
pkgdesc="Support for MD3, MDC, MDS, MDM/MDX and TAG file formats for the 3D modeling software Blender."
arch=('any')
license=("Unknown")
url="https://github.com/mino-git/rtcw-wet-blender-model-tools"
depends=('blender')
makedepends=('git')
source=("${_pkgname}::git+${url}#branch=${BRANCH:-master}")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

package() {
    cd "${srcdir}/${_pkgname}"

    blender_scripts_dir=$(pacman -Ql blender | grep -Po '/usr/share/blender/[\d\.]+/scripts/$')

    target_dir="${pkgdir}/${blender_scripts_dir}/addons/"
    mkdir -p "$target_dir"

    cp -R "./src/addons/rtcw_et_model_tools" "$target_dir"
}

# vim:set ft=sh syn=sh ts=4 sw=4 et:

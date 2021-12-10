# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=xclean
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r0
pkgrel=6
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('any')
url='https://forum.doom9.org/showthread.php?t=183245'
license=('GPL')
depends=('vapoursynth-plugin-rgsf-git'
         'vapoursynth-plugin-knlmeanscl-git'
         'vapoursynth-plugin-fmtconv'
         'vapoursynth-plugin-mvtools'
         'vapoursynth-plugin-mvtools_sf-git'
         'vapoursynth-plugin-temporalmedian-git'
         )
makedepends=('git')
source=("${_plug}::git+https://github.com/mysteryx93/xClean.git")
sha256sums=('SKIP')

_site_packages="$(python -c 'import sysconfig; print(sysconfig.get_paths()["purelib"])')"

package(){
  cd "${_plug}"
  install -Dm644 xClean.py "${pkgdir}${_site_packages}/xClean.py"
  python -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/xClean.py"
  python -OO -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/xClean.py"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}

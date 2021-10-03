# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=mvsfunc
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=v10.r63.03a9e58
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url='http://forum.doom9.org/showthread.php?t=172564'
license=('GPL')
depends=('vapoursynth-plugin-fmtconv-git'
         'vapoursynth-plugin-bm3d-git'
         )
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/AmusementClub/mvsfunc.git")
sha256sums=('SKIP')

_site_packages="$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")"

pkgver() {
  cd "${_plug}"
  _ver="$(cat mvsfunc.py | grep -m1 MvsFuncVersion | grep -o "[[:digit:]]*")"
  echo "v${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd "${_plug}"
  install -Dm644 "${_plug}.py" "${pkgdir}${_site_packages}/${_plug}.py"
  python -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/${_plug}.py"
  python -OO -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/${_plug}.py"
}

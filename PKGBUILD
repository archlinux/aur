# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=nnedi3_resample
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=22.e79c702
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url='https://github.com/AmusementClub/nnedi3_resample'
license=('GPL')
depends=('vapoursynth-plugin-fmtconv-git'
         'vapoursynth-plugin-mvsfunc-git'
         )
optdepends=('vapoursynth-plugin-nnedi3-git'
            'vapoursynth-plugin-znedi3-git'
            'vapoursynth-plugin-nnedi3cl-git'
            )
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/AmusementClub/nnedi3_resample.git")
sha256sums=('SKIP')

_site_packages="$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")"

pkgver() {
  cd "${_plug}"
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd "${_plug}"
  install -Dm644 "${_plug}.py" "${pkgdir}${_site_packages}/${_plug}.py"
  python -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/${_plug}.py"
  python -OO -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/${_plug}.py"

  install -Dm644 nnedi3_resample-readme.txt "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/readme.txt"
}

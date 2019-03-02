# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=vstaambk
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=0.8.0.r105.b1938f6
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url='https://github.com/HomeOfVapourSynthEvolution/vsTAAmbk'
license=('GPL')
depends=('vapoursynth'
         'vapoursynth-plugin-awarpsharp2-git'
         'vapoursynth-plugin-eedi2-git'
         'vapoursynth-plugin-nnedi3-git'
         'vapoursynth-plugin-fmtconv-git'
         'vapoursynth-plugin-mvsfunc-git'
         'vapoursynth-plugin-mvtools-git'
         'vapoursynth-plugin-temporalsoften-git'
         'vapoursynth-plugin-tcanny-git'
         'vapoursynth-plugin-sangnom-hg'
         'vapoursynth-plugin-havsfunc-git'
         )
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/HomeOfVapourSynthEvolution/vsTAAmbk.git")
sha256sums=('SKIP')

_site_packages="$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")"

pkgver() {
  cd "${_plug}"
  _ver="$(cat README.md | grep '# vsTAAmbk' | cut -d ' ' -f3)"
  echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd "${_plug}"
  install -Dm644 vsTAAmbk.py "${pkgdir}${_site_packages}/vsTAAmbk.py"
  python -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/vsTAAmbk.py"
  python -OO -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/vsTAAmbk.py"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}

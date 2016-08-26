# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=vstaambk
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=0.4.1.r16.ddcd6fe
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url='https://github.com/HomeOfVapourSynthEvolution/vsTAAmbk'
license=('GPL')
depends=('vapoursynth-plugin-eedi2-git'
         'vapoursynth-plugin-nnedi3-git'
         'vapoursynth-plugin-fmtconv'
         'vapoursynth-plugin-genericfilters-git'
         'vapoursynth-plugin-msmoosh-git'
         'vapoursynth-plugin-mvtools'
         'vapoursynth-plugin-temporalsoften-git'
         'vapoursynth-plugin-sangnom-hg'
         'vapoursynth-plugin-havsfunc'
         )
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/HomeOfVapourSynthEvolution/vsTAAmbk.git"
        'https://patch-diff.githubusercontent.com/raw/HomeOfVapourSynthEvolution/vsTAAmbk/pull/1.patch'
        )
sha1sums=('SKIP'
          '4bc3de4848f38c39c323e47ceaba39edc3b26cc2'
          )
_sites_packages="$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")"

pkgver() {
  cd "${_plug}"
  _ver="$(cat README.md | grep '# vsTAAmbk' | cut -d ' ' -f3)"
  echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_plug}"
  patch -p1 -i "${srcdir}/1.patch"
}

package() {
  cd "${_plug}"
  install -Dm644 vsTAAmbk.py "${pkgdir}${_sites_packages}/vsTAAmbk.py"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}

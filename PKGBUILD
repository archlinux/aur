# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=fvsfunc
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r29.076dbde
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url='https://github.com/Irrational-Encoding-Wizardry/fvsfunc'
license=('GPL')
depends=('vapoursynth-plugin-havsfunc'
         'vapoursynth-plugin-mvsfunc-git'
         'vapoursynth-plugin-muvsfunc-git'
         'vapoursynth-plugin-edi_rpow2-git'
         'vapoursynth-plugin-nnedi3-git'
         'vapoursynth-plugin-fmtconv'
         'vapoursynth-plugin-bilateral-git'
         'vapoursynth-plugin-dfttest-git'
         'vapoursynth-plugin-ffms2'
         'vapoursynth-plugin-fft3dfilter-git'
         'vapoursynth-plugin-mvtools'
         'vapoursynth-plugin-sangnom-git'
         'vapoursynth-plugin-yadifmod-git'
         )
optdepends=('vapoursynth-plugin-bilateralgpu-git'
            'vapoursynth-plugin-descale-git'
            )
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/Irrational-Encoding-Wizardry/fvsfunc.git")
sha256sums=('SKIP')

_site_packages="$(python -c 'import sysconfig; print(sysconfig.get_paths()["purelib"])')"

pkgver() {
  cd "${_plug}"
  #echo "$(git describe --long --tags | tr - .)"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package(){
  cd "${_plug}"
  install -Dm644 "${_plug}.py" "${pkgdir}${_site_packages}/${_plug}.py"
  python -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/${_plug}.py"
  python -OO -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/${_plug}.py"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}

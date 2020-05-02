# Maintainer:  Dave <orangechannel@pm.me>
# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=acsuite
pkgname=vapoursynth-tools-${_plug}-git
pkgver=4.0.0.r0.g9f9821d
pkgrel=1
pkgdesc="Tool for VapourSynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/OrangeChannel/acsuite'
license=('Unlicense')
depends=('vapoursynth'
         'mkvtoolnix-cli'
         )
optdepends=('ffmpeg: WAV output support')
makedepends=('git')
provides=("vapoursynth-tools-${_plug}"
          "vapoursynth-plugin-${_plug}-git"
          )
conflicts=("vapoursynth-tools-${_plug}"
           "vapoursynth-plugin-${_plug}-git"
           )
source=("${_plug}::git+https://github.com/OrangeChannel/acsuite.git")
sha256sums=('SKIP')

_site_packages="$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")"

pkgver() {
  cd "${_plug}"
  git describe --long | sed 's/^v//;s/-/.r/;s/-/./'
}

package(){
  cd "${_plug}"
  install -Dm644 "${_plug}.py" "${pkgdir}${_site_packages}/${_plug}.py"
  python -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/${_plug}.py"
  python -OO -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/${_plug}.py"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/tools/${_plug}/README.md"
  install -Dm644 UNLICENSE "${pkgdir}/usr/share/licenses/${pkgname}/UNLICENSE"
}

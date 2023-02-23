# Maintainer: dummyx <dummyx at gmail dot com>
# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=havsfunc
pkgname=vapoursynth-plugin-${_plug}
pkgver=r33
pkgrel=3
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('any')
url='https://github.com/HomeOfVapourSynthEvolution/havsfunc'
license=('GPL')
depends=('vapoursynth'
         'vapoursynth-plugin-vsutil'
         'vapoursynth-plugin-mvsfunc')
optdepends=('vapoursynth-plugin-adjust'
            'vapoursynth-plugin-addgrain'
            'vapoursynth-plugin-awarpsharp2'
            'vapoursynth-plugin-bilateral'
            'vapoursynth-plugin-ctmf'
            'vapoursynth-plugin-dctfilter'
            'vapoursynth-plugin-dfttest'
            'vapoursynth-plugin-eedi2'
            'vapoursynth-plugin-deblock'
            'vapoursynth-plugin-eedi3m'
            'vapoursynth-plugin-fft3dfilter'
            'vapoursynth-plugin-f3kdb'
            'vapoursynth-plugin-fluxsmooth'
            'vapoursynth-plugin-fmtconv'
            'vapoursynth-plugin-knlmeanscl'
            'vapoursynth-plugin-mvtools'
            'vapoursynth-plugin-nnedi3_resample'
            'vapoursynth-plugin-nnedi3'
            'vapoursynth-plugin-nnedi3cl'
            'vapoursynth-plugin-sangnom'
            'vapoursynth-plugin-svpflow1'
            'vapoursynth-plugin-svpflow2-bin'
            'vapoursynth-plugin-ttempsmooth'
            'vapoursynth-plugin-znedi3')

provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}-git")
source=("${_plug}-${pkgver}.tar.gz::https://github.com/HomeOfVapourSynthEvolution/havsfunc/archive/${pkgver}.tar.gz")
sha256sums=('87446e937145c19f94b6ef51776099918140d439a142c460454e7e17cff0778e')

_site_packages="$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")"

package() {
  install -Dm644 "${_plug}-${pkgver}/${_plug}.py" "${pkgdir}${_site_packages}/${_plug}.py"
  python -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/${_plug}.py"
  python -OO -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/${_plug}.py"
}

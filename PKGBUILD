# Maintainer:  Dave <orangechannel@pm.me>
# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=acsuite
pkgname=vapoursynth-tools-${_plug}-git
pkgver=5.0.0.r0.g240ab21
pkgrel=1
pkgdesc="Frame-based cutting/trimming/splicing of audio with VapourSynth (GIT version)"
arch=('x86_64')
url='https://github.com/OrangeChannel/acsuite'
license=('Unlicense')
depends=('vapoursynth'
         'ffmpeg'
         )
makedepends=('git'
             'python-setuptools'
             )
provides=("vapoursynth-tools-${_plug}"
          "vapoursynth-plugin-${_plug}-git"
          )
conflicts=("vapoursynth-tools-${_plug}"
           "vapoursynth-plugin-${_plug}-git"
           )
source=("${_plug}::git+https://github.com/OrangeChannel/acsuite.git")
sha256sums=('SKIP')

# _site_packages="$(python -c 'import sysconfig; print(sysconfig.get_paths()["purelib"])')"

pkgver() {
  cd "${_plug}"
  git describe --long | sed 's/^v//;s/-/.r/;s/-/./'
}

package(){
  cd "${_plug}"
  python setup.py install --root="$pkgdir/" --optimize=1

  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/tools/${_plug}/README.md"
  install -Dm644 UNLICENSE "${pkgdir}/usr/share/licenses/${pkgname}/UNLICENSE"
}

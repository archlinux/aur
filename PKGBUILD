# Maintainer: Dave <orangechannel@pm.me>
# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=acsuite
pkgname=vapoursynth-tools-${_plug}-git
pkgver=6.0.0.4.ge40f503
pkgrel=2
pkgdesc="Frame-based cutting/trimming/splicing of audio with VapourSynth (GIT version)"
arch=('x86_64')
url='https://github.com/OrangeChannel/acsuite'
license=('Unlicense')
depends=('vapoursynth'
         'ffmpeg'
         )
makedepends=('git'
             'python-pip'
             'python-wheel'
             )
provides=("vapoursynth-tools-${_plug}"
          "vapoursynth-plugin-${_plug}-git"
          )
conflicts=("vapoursynth-tools-${_plug}"
           "vapoursynth-plugin-${_plug}-git"
           )
source=("${_plug}::git+https://github.com/OrangeChannel/acsuite.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - . | tr -d v)"
}

build() {
  cd "${_plug}"
  pip wheel --no-deps . -w dist
}

package() {
  cd "${_plug}"
  pip install -I -U --root "${pkgdir}" --no-warn-script-location --no-deps dist/*.whl

  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/tools/${_plug}/README.md"
  install -Dm644 UNLICENSE "${pkgdir}/usr/share/licenses/${pkgname}/UNLICENSE"
}

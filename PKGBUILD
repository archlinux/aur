# Maintainer:  Dave <orangechannel@pm.me>

_plug=getnative
pkgname=vapoursynth-tools-${_plug}-git
pkgver=3.2.1.0.gfd8c737
pkgrel=1
pkgdesc="Tool for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url='https://github.com/Infiziert90/getnative'
license=('MIT')
depends=('python-matplotlib'
         'vapoursynth-plugin-descale'
         'vapoursynth-plugin-ffms2'
         'vapoursynth-plugin-lsmashsource'
         )
makedepends=('git'
             'python-pip'
             'python-wheel'
             )
provides=("vapoursynth-tools-${_plug}")
conflicts=("vapoursynth-tools-${_plug}" )
source=("${_plug}::git+https://github.com/Infiziert90/${_plug}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

build() {
  cd "${_plug}"
  pip wheel --no-deps . -w dist
}

package() {
  cd "${_plug}"
  pip install -I -U --root "${pkgdir}" --no-warn-script-location --no-deps dist/*.whl

  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/tools/${_plug}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

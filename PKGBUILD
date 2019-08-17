# Maintainer: Leo Mao <leomaoyw at gmail dot com>
pkgname=python-torchaudio-git
_pkgname=audio
pkgver=0.4.0a0+a450cf8
pkgrel=1
pkgdesc="simple audio I/O for pytorch"
arch=('any')
url="https://github.com/pytorch/audio"
_github='pytorch/audio'
license=('BSD')
depends=('python' 'sox' 'python-pytorch')
optdepends=('python-kaldi-io')
makedepends=('git' 'python-setuptools')
provides=('python-torchaudio')
conflicts=('python-torchaudio')
source=("git+$url")
sha256sums=('SKIP')

pkgver () {
  cd "${_pkgname}"
  (
    set -o pipefail
    python setup.py --version 2>/dev/null | tail -n 1
  )
}

build() {
  msg "Building Python 3"
  cd "${srcdir}/${_pkgname}"
  python setup.py build_ext
}

package() {
  cd "${srcdir}/${_pkgname}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:

# Maintainer: Leo Mao <leomaoyw at gmail dot com>
pkgname=python-torchaudio-git
_pkgname=audio
pkgver=r222.bdf9255
pkgrel=1
pkgdesc="Data manipulation and transformation for audio signal processing, powered by PyTorch"
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
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  msg "Building Python 3"
  cd "${srcdir}/${_pkgname}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:

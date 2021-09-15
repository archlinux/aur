# Maintainer : Frikilinux <frikilinux@gmail.com>

pkgname=python-aigpy-git
_pkgname=AIGPY
pkgver=r66.2d65c80
pkgrel=1
pkgdesc="Python-universal-library."
arch=('any')
url="https://github.com/AIGMix/AIGPY"
license=('MIT')
depends=('ffmpeg' 'python-requests' 'python-colorama' 'python-mutagen')
makedepends=('python-setuptools')
source=(git+"${url}.git")
sha256sums=('SKIP')
conflicts=('python-aigpy')
provides=('python-aigpy')


pkgver() {
  cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"
  python setup.py build
}

package() {
  cd "${_pkgname}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
}

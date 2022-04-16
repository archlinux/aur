# Maintainer: Alexis Jeandeau <alexis[dot]jeandeau[at]gmail[dot]com>

pkgname=python-midi-git
_gitname=python-midi
pkgver=r50.fec80bd
pkgrel=3
pkgdesc="A feature-rich, hardware-independent MIDI toolkit for Python"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/aspiers/python-midi"
license=('MIT')
depends=('alsa-lib' 'python')
makedepends=('git' 'python-setuptools' 'swig')
provides=('python-midi')
conflicts=('python2-midi')
source=('git+https://github.com/aspiers/python-midi')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"

  # No tag, use the number of revisions since the beginning of the history
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_gitname}"

  python setup.py build
}

package() {
  cd "${srcdir}/${_gitname}"

  python setup.py install --root="${pkgdir}" --optimize=1

  # License is MIT clause type and needs to be installed
  # The fork doesn't have the license file, so retrieve it from upstream
  wget "https://raw.githubusercontent.com/vishnubob/python-midi/master/LICENSE"
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:

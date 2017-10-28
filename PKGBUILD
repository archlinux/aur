# Maintainer: vsilv vsilv@posteo.eu

pkgname=python-spotify-ripper-git
pkgver=r451.d046419
pkgrel=1
pkgdesc='Command-line ripper for Spotify (python3)'
arch=('x86_64')
url="https://github.com/hbashton/spotify-ripper"
license=('MIT')
depends=('python' 'python-spotify' 'python-colorama' 'python-mutagen' 'python-requests' 'python-schedule' 'flac' 'lame')
makedepends=('python-setuptools' 'git')
provides=('python-spotify-ripper')
_gitname=python-spotify-ripper
source=(${_gitname}"::git+https://github.com/hbashton/spotify-ripper.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

build() {
  cd "${srcdir}/${_gitname}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_gitname}"
  python setup.py install --prefix=/usr --root=${pkgdir} -O1 --skip-build
}


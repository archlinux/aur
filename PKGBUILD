# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Javier Lloris

pkgname=trimage-git
pkgver=20190305
pkgrel=1
pkgdesc="A GUI based lossless image compressor."
url="http://trimage.org"
arch=('any')
license=('MIT')
depends=("python-pyqt5" "python-sip-pyqt5" "optipng" "advancecomp" "jpegoptim" "pngcrush")
makedepends=("git")
conflicts=("trimage")
provides=("trimage")
source=("git+https://github.com/Kilian/Trimage.git#branch=master")
md5sums=("SKIP")

_gitname="Trimage"

pkgver() {
  cd "$srcdir/$_gitname"
  git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

build() {
  cd "$srcdir/$_gitname"

  # find ./ -type f -name '*.py' | xargs -n 1 sed -i 's|/usr/bin/env python3|/usr/bin/env python|'
  # sed -i 's|/usr/bin/env python|/usr/bin/env python3|' trimage

  python setup.py build
}

package() {
  cd "$srcdir/$_gitname"
  python setup.py install --prefix=/usr --root="$pkgdir"
}

# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=trimage-git
pkgver=20110928
pkgrel=1
pkgdesc="A GUI based lossless image compressor."
url="http://trimage.org"
arch=('any')
license=('MIT')
depends=("python2-pyqt" "optipng" "advancecomp" "jpegoptim" "pngcrush")
makedepends=("git")
conflicts=("trimage")
provides=("trimage")
source=("git://github.com/Kilian/Trimage.git")
md5sums=("SKIP")

_gitname="Trimage"

pkgver() {
  cd "$_gitname"
  git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

build() {
  cd "$srcdir/$_gitname"

  find ./ -type f -name '*.py' | xargs -n 1 sed -i 's|/usr/bin/env python|/usr/bin/env python2|'
  sed -i 's|/usr/bin/env python|/usr/bin/env python2|' trimage

  python2 setup.py build
}

package() {
  cd "$srcdir/$_gitname"
  python2 setup.py install --prefix=/usr --root="$pkgdir"
}

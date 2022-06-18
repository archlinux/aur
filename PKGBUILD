# Maintainer: @RubenKelevra <cyrond@gmail.com>
# Contributor: Jose Riha <jose1711 [at] gmail (dot) com>

pkgname=ratarmount-git
pkgver=20191206
pkgrel=1
pkgdesc="Mount tar file using fuse with fast read-only random access (git version)"
arch=('any')
url="https://github.com/mxmlnkn/ratarmount"
license=("MIT")
depends=('python-fusepy' 'python-msgpack' 'python-rapidjson' 'python-ujson' 'python-simplejson')
optdepends=('python-indexed-gzip: Support for gzip-compressed tar files')
source=(git+https://github.com/mxmlnkn/ratarmount)
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build() {
  cd $srcdir/ratarmount
  python setup.py build
}


package() {
  cd $srcdir/ratarmount
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm755 "${srcdir}/ratarmount/README.md" "${pkgdir}/usr/share/doc/ratarmount/README.md"
}


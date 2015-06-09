# Maintainer: sudokode <sudokode@gmail.com>

pkgname=m4b-converter-git
pkgver=0.5.r27.6060ccc
pkgrel=1
pkgdesc="Convert m4b audio books to a group of mp3 files by chapter"
arch=('any')
url="https://github.com/valekhz/m4b-converter"
license=('MPL')
depends=('python2' 'ffmpeg' 'libmp4v2')
makedepends=('git')
source=("$pkgname::git+https://github.com/valekhz/m4b-converter.git")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname

  echo "$(git describe --tags | sed 's/^v//').r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd $pkgname

  # Fix python2 shebang
  sed -i 's/python/python2/' m4b.py
}

package() {
  cd $pkgname

  mkdir -p "$pkgdir"/usr/lib/python2.7/site-packages
  install -D -m644 libmp4v2.py "$pkgdir"/usr/lib/python2.7/site-packages/libmp4v2.py
  install -D -m755 m4b.py "$pkgdir"/usr/lib/python2.7/site-packages/m4b.py

  mkdir -p "$pkgdir"/usr/bin
  ln -s /usr/lib/python2.7/site-packages/m4b.py "$pkgdir"/usr/bin/m4b-converter
}

# vim:set ts=2 sw=2 et:

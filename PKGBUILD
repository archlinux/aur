# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Tuan Nguyen 
# Contributor: Farid <farid at archlinux-br dot org>

pkgname=pdfshuffler
pkgver=0.6.0
pkgrel=2
pkgdesc="Merge or split pdf documents and rotate, crop and rearrange their pages"
arch=('any')
url="http://sourceforge.net/projects/pdfshuffler/"
license=('GPL3')
depends=('python2-poppler' 'python2-pypdf' 'ghostscript')
install="$pkgname.install"
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('573f42e8392d20e6f03557096c85c178')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --prefix=/usr \
                           --root="$pkgdir/"

  # python2 fix
  find "$pkgdir" -name "*.py" -exec \
    sed -i "s/python/&2/" {} \;
}

# vim:set ts=2 sw=2 et:

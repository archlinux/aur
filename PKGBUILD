# Maintainer :  M.Reynolds <blackboxnetworkproject@gmail.com>
# Contributor:  speps <speps at aur dot archlinux dot org>
# Contributor:  Anton Bazhenov <anton.bazhenov at gmail>
# Contributor:  Tuan Nguyen 
# Contributor:  Farid <farid at archlinux-br dot org>

pkgname=pdfshuffler
pkgver=0.6.0
pkgrel=3
pkgdesc="Merge or split pdf documents and rotate, crop and rearrange their pages"
arch=('any')
url="http://sourceforge.net/projects/pdfshuffler/"
license=('GPL3')
depends=('python2-poppler' 'python2-pypdf2' 'python2-pypdf' 'ghostscript')
conflicts=('pdfshuffler-git')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('df3629b5a0ba91fda6b703ddf7b3e6f224a01d5cdfb76a5de77d67615466ef58')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python2 setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python2 setup.py install --prefix=/usr --root="$pkgdir/"

# python2 fix
    find "$pkgdir" -name "*.py" -exec \
    sed -i "s/python/&2/" {} \;
}

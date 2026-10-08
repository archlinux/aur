# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>
# Upstream tags nothing, so pkgver is the pinned commit's date and _tag carries
# the commit itself.

pkgname=naivepca
_tag=45ddc99b82288b81c7b09419ca1fb4e1214e91fb
pkgver=20160727
pkgrel=1
pkgdesc="Naive PCA for genotype data"
arch=('x86_64')
url="https://github.com/lh3/naivepca"
license=('MIT')
depends=('glibc' 'zlib')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/${_tag}.tar.gz")
sha256sums=('124f25005f157fd1e7149e838a5aabffae4d6b623098bae0d83aabdc10bd3873')

build() {
    cd "$srcdir/$pkgname-$_tag"
    make
}

package() {
    cd "$srcdir/$pkgname-$_tag"
    install -Dm755 naivepca "$pkgdir/usr/bin/naivepca"
    # upstream ships no LICENSE file; the grant is the MIT block in kseq.h
    awk 'NR==1,/^\*\//' kseq.h > LICENSE
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

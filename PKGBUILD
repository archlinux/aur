#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

_pkgbase=noto-fonts
pkgname=noto-fonts-unhinted
pkgver=20161221
_commit=e5782aa
pkgrel=2
pkgdesc='Unhinted complement for noto-fonts'
arch=(any)
url='http://www.google.com/get/noto'
license=(custom:OFL)
depends=("noto-fonts=$pkgver")
conflicts=("noto-fonts>$pkgver")
source=("https://github.com/googlei18n/noto-fonts/archive/$_commit.zip")
sha256sums=('9a0463b9922eaff3d64786982645e4027b6390c1e0cb870a7c9747ed364d387f')

build()
{
    cd $_pkgbase-*/hinted
    ls *.ttf |sort -o ../hinted.txt
    cd ../unhinted
    ls *.ttf |sort -o ../unhinted.txt
    cd ..
    comm -13 hinted.txt unhinted.txt > list.txt
}

package()
{
    cd $_pkgbase-*
    install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    mkdir -p "$pkgdir"/usr/share/fonts/noto/unhinted
    cd unhinted
    for file in `cat ../list.txt`; do
        install -m644 "$file" "$pkgdir"/usr/share/fonts/noto/unhinted
    done
}

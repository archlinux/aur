#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

_pkgbase=noto-fonts
pkgname=noto-fonts-unhinted
pkgver=20161003
_commit=3dfd3e9
pkgrel=1
pkgdesc='Unhinted complement for noto-fonts'
arch=(any)
url='http://www.google.com/get/noto'
license=(custom:OFL)
depends=('noto-fonts>='"$pkgver")
source=("https://github.com/googlei18n/noto-fonts/archive/$_commit.zip")
md5sums=('b5d8a66844d36f59c5622e633f1eb234')
install="$pkgname.install"

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

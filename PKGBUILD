#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

_pkgbase=noto-fonts
pkgname=noto-fonts-unhinted
pkgver=20160613
_commit=19ce9d5
pkgrel=1
pkgdesc='unhinted complement for noto-fonts'
arch=(any)
url='http://www.google.com/get/noto'
license=(custom:OFL)
depends=('noto-fonts>='"$pkgver")
source=("https://github.com/googlei18n/noto-fonts/archive/$_commit.zip")
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
md5sums=('2b03df1b4ae95d076f892d69d4f2265f')

#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgbase=noto-fonts
pkgname=noto-fonts-unhinted
pkgver=20151224
_commit=3f1dc1
pkgrel=1
pkgdesc='unhinted complement for noto-fonts'
arch=(any)
url='http://www.google.com/get/noto'
license=(custom:OFL)
depends=(noto-fonts)
source=("https://github.com/googlei18n/noto-fonts/archive/$_commit.zip")
install="$pkgname.install"

build()
{
    cd $pkgbase-*/hinted
    ls *.ttf |sort -o ../hinted.txt
    cd ../unhinted
    ls *.ttf |sort -o ../unhinted.txt
    cd ..
    comm -13 hinted.txt unhinted.txt > list.txt
}

package()
{
    cd $pkgbase-*
    install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    mkdir -p "$pkgdir"/usr/share/fonts/noto/unhinted
    cd unhinted
    for file in `cat ../list.txt`; do
        install -m644 "$file" "$pkgdir"/usr/share/fonts/noto/unhinted
    done
}
md5sums=('460cc0060652b912a050f8f820b49a0d')

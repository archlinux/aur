# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=pngzop
pkgver=1.0.2
pkgrel=1
pkgdesc='Tool for optimizing the compression of PNG files using pnggcrush and zopfli'
url='http://pmt.sourceforge.net/pngzop'
arch=('x86_64')
license=('custom')
depends=('pngcrush' 'zopfli' 'zlib-zpipe')
source=(https://sourceforge.net/projects/pmt/files/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz{,.asc}
        LICENSE)
sha512sums=('4a674537f71c2d4cc2df7395209fc03668a8181cf3d5c9e2fe84ee8c961d8b4033384b70664d0791545e19c294d19fc61a82e63eebe1846c201bfe869c775fde'
            'SKIP'
            '56875595fcd27ba3adfcf37199958443083c8b24254f50ec5f79ef70edd89dbafd399fc7b1bf65a471a9119e10d249c2b5fe68a79d359fc2cbb5f290c7ad4d9a')
validpgpkeys=('8048643BA2C840F4F92A195FF54984BFA16C640F') # Glenn Randers-Pehrson (pngcrush) <glennrp@users.sourceforge.net>

prepare() {
  sed -i 's+.exe++' $pkgname
  sed -i 's+zpipe+zlib-zpipe+' $pkgname
}

build() {
  for _i in *.c
  do
    gcc $_i -o ${_i%.c} -lz
  done
}

package() {
  for _i in *.c 
  do
    install -Dm 755  ${_i%.c} "$pkgdir"/usr/bin/${_i%.c}
  done
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm 644 "LICENSE" -t "${pkgdir}"/usr/share/licenses/${pkgname}
}

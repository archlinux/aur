# Maintainer: orumin <dev@orum.in>

pkgname=istrings
pkgver=0.2
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL2')
pkgdesc="strings - print the strings of printable characters in files, supported variety character encodings (e.g. Unicode)."
url="http://openmya.hacker.jp/hasegawa/istrings/"
source=('http://openmya.hacker.jp/hasegawa/istrings/istrings-0.2.lzh'
        'istrings.1.gz')
makedepends=(lhasa)
sha512sums=('49b9566212ceacb4999dc8d556028a60ff6ff9c942be428ac119c080f8bf6f2ce1d40e914950a722367b63dd41a040737916ff7db5a13cc5c7f8569d678d13d9'
            '73fcbb0ee3c7be958505e9bd519f8eb86b50b3148483d5464535128cf85456169fc4a1911fad8f96ee1880550d237fce9c5af173507c6f7c1962a3da127ccbce')

build () {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make -f Makefile.gcc
}

package () {
  cd "${srcdir}/${pkgname}-${pkgver}"

  sed -i -e 's/C:\\Program Files\\istrings-0\.2/\\usr\\share\\istrings/g; s/\\/\//g' "${pkgname}.ini"


  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${pkgname}.ini" "${pkgdir}/etc/${pkgname}.ini"
  install -Dm644 "${srcdir}/${pkgname}.1.gz" "${pkgdir}/usr/share/man/ja/man1/${pkgname}.1.gz"

  install -d "${pkgdir}/usr/share/${pkgname}/map"
  install -m 644 map/* "${pkgdir}/usr/share/${pkgname}/map/"
}

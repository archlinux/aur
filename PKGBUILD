# Maintainer: Levente Polyak <levente[at]leventepolyak[dot]net>

pkgname=shellnoob
pkgver=2.1
pkgrel=1
pkgdesc="A toolkit that eases the writing and debugging of shellcode"
url="https://github.com/reyammer/shellnoob"
arch=('any')
license=('MIT')
depends=('python' 'binutils' 'gcc')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/reyammer/${pkgname}/archive/v${pkgver}.tar.gz)
sha512sums=('20ee2ae0b39df077e623b15a013d9177e8df84e9ac519ad95b0836708d25cccd24661db34982f03717f42bfd2131c56a3a0e9356e3502cdc6593415ab5e087c1')

prepare() {
  cd ${pkgname}-${pkgver}
  sed -e "s|README|/usr/share/doc/${pkgname}/README.md|g" -i shellnoob.py
}

package() {
  cd ${pkgname}-${pkgver}

  install -Dm 755 shellnoob.py "${pkgdir}/usr/lib/python3.4/site-packages/shellnoob.py"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/python3.4/site-packages/shellnoob.py" "${pkgdir}/usr/bin/snoob"

  install -Dm 644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -d "${pkgdir}/usr/share/doc/${pkgname}/samples/x86-linux"
  install -Dm 644 samples/x86-linux/* "${pkgdir}/usr/share/doc/${pkgname}/samples/x86-linux"
}

# vim: ts=2 sw=2 et:

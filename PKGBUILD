# Maintainer: Antoine Lubineau <antoine@lubignon.info>

pkgname=cadubi
pkgver=1.3.1
pkgrel=2
pkgdesc="Creative ASCII Drawing Utility By Ian"
arch=('any')
url="https://github.com/statico/cadubi"
license=('MIT')
depends=('perl-term-readkey')
source=(https://github.com/statico/$pkgname/archive/v$pkgver.tar.gz
        perl-5.22.patch)
sha1sums=('ee6d4a2b0e19e4e516b438895a2b4bf5224c4038'
          'cd2f8460939e9d0090a3ada40f42c6ed70960380')

prepare() {
  cd $pkgname-$pkgver

  patch -p1 < ../perl-5.22.patch
  sed 's|$Bin/help.txt|/usr/share/cadubi/help.txt|g' -i cadubi
}

package() {
  cd $pkgname-$pkgver

  install -d "$pkgdir"/usr/bin
  ln -s /usr/share/cadubi/cadubi "$pkgdir"/usr/bin/cadubi

  install -Dm755 cadubi "$pkgdir"/usr/share/cadubi/cadubi
  install -Dm644 help.txt "$pkgdir"/usr/share/cadubi/help.txt

  install -Dm644 cadubi.1 "$pkgdir"/usr/share/man/man1/cadubi.1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

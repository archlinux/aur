# Maintainer: Aleksandr <contact at via dot aur>

pkgname=m17n-cu-git
pkgver=r31.39dd115
pkgrel=1
pkgdesc='Church Slavic data for m17n database'
arch=('any')
url='https://github.com/typiconman/m17n-cu'
license=('GPL-3.0')
depends=('ibus-m17n')
conflicts=('m17n-cu')
install=install
source=('m17n-cu::git+https://github.com/typiconman/m17n-cu.git'
        "http://www.ponomar.net/files/docen.pdf")

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  make DESTDIR="$pkgdir/" install
  install -dm755 "$pkgdir/usr/share/license/$pkgname"
  install -dm755 "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/license/$pkgname/"
  install -Dm644 INSTALL "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 RUSSIAN "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 "$srcdir/docen.pdf" "$pkgdir/usr/share/doc/$pkgname/"
}

md5sums=('SKIP'
         'f38db7908493cae9e08327b4e501f6ee')

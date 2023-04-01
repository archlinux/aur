# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Jeff Mickey <j@codemac.net>

pkgname=wtf
pkgver=20220926
pkgrel=1
pkgdesc="Acronym dictionary, with additions from NetBSD and wikipedia"
arch=('any')
url="http://www.mu.org/~mux/wtf/"
license=('BSD')
makedepends=('git')
#source=("http://www.mu.org/~mux/${pkgname}/${pkgname}-${pkgver}.tar.gz"
#source=("git+https://github.com/void-linux/netbsd-wtf#commit=b1e5be48"
source=("https://sourceforge.net/projects/bsdwtf/files/wtf-$pkgver.tar.gz"
        "https://raw.github.com/keenerd/wtf/0623381d92b2c5d3e94b00c9eb06fb5d4d85d014/acronyms.computing"
        'LICENSE')
md5sums=('fcf774ca93e2509f1a7a38b268db6be1'
         '3d99862438ec7977ff8d7f4e3e5dd300'
         'abac213cf24e9d5cab4e8115441eb717')

prepare() {
  cd "$srcdir/wtf-$pkgver"
  sed -i 's|/usr/share/misc/|/usr/share/wtf/|' wtf
}

package() {
  cd "$srcdir/wtf-$pkgver"
  install -Dm755 wtf      "$pkgdir/usr/bin/wtf"
  install -Dm644 wtf.6    "$pkgdir/usr/share/man/man6/wtf.6"
  install -Dm644 acronyms "$pkgdir/usr/share/wtf/acronyms"
  install -Dm644 acronyms.comp   "$pkgdir/usr/share/wtf/acronyms.comp"
  #install -Dm644 acronyms-o.fake "$pkgdir/usr/share/wtf/acronyms-o"
  install -Dm644 acronyms-o.real "$pkgdir/usr/share/wtf/acronyms-o"
  
  install -m644 ../acronyms.computing "$pkgdir/usr/share/wtf/"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

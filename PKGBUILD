# Maintainer: Daniel Menelkir <dmenelkir@gmail.com>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Jeff Mickey <j@codemac.net>

pkgname=wtf
pkgver=20230401
pkgrel=1
pkgdesc="Acronym dictionary, with additions from NetBSD and wikipedia"
arch=('any')
url="https://sourceforge.net/projects/bsdwtf/"
license=('BSD')
makedepends=('git')
source=("https://sourceforge.net/projects/bsdwtf/files/wtf-$pkgver.tar.gz"
        "https://raw.github.com/keenerd/wtf/0623381d92b2c5d3e94b00c9eb06fb5d4d85d014/acronyms.computing"
        'LICENSE')
sha512sums=('6e4f28691933cb710f0a13156c85998c382d5c80c426811c63fc06fa15019868c2838f20e683354168e3f34706a4d36dc39270e1efd68881c7e9fd271681dbe3'
           'a122d65d9279f0cdae63f73179381a4f0b4e5ffd257e64796cf610c9a844b48ec0f291baaef0f0127792901ffc038c9879c5f507625eae71bd82f8e917cd4078'
           'c4b25b4408e73a281c536ce02857ce0abe50a184f200bce16be48df2381724277b5b3eaa8d68589d410e7dd0d708fb6d22a75d8e55c272572dd436ad14a62ebd')

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

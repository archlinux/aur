# Maintainer: Tommaso Sardelli <lacapannadelloziotom [at] gmail [dot] com>
# Contributor: Pat Brisbin <pbrisbin@gmail.com>
pkgname='gitsh'
pkgver=0.14
pkgrel=2
pkgdesc='An interactive shell for git'
arch=('i686' 'x86_64')
url="https://github.com/thoughtbot/gitsh"
license=('custom')
depends=('ruby' 'readline')
source=("https://github.com/thoughtbot/gitsh/releases/download/v$pkgver/gitsh-$pkgver.tar.gz"
        "build.patch")
sha512sums=('b04adda46770d26f4cd6d2d9226c1e0cb6823ccfe93a4952888de10f96570233842e98eaf8bf1edae8c40cda5708103679cc494333868f754f6d003fea6fe013'
            'c5b99cefba9f74427a1c291a6ad181f7bbf003ed23fd54f24c46a75c3e7026788868c0e053d83213ab6845d5e41770f28d79486bc59fc08880853dedaa0641ec')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -i ../build.patch
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure \
     --disable-debug \
     --disable-dependency-tracking \
     --disable-silent-rules \
     --prefix=/usr

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:

# Contributor: Omar Campagne Polaino <ocampagne at gmail com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=mailcheck
pkgver=1.91.2
pkgrel=2
pkgdesc="Check multiple mailboxes/maildirs for mail from the command line."
url=("http://mailcheck.sourceforge.net/")
arch=('i686' 'x86_64')
license=('GPL2')
makedepends=('quilt')
changelog=ChangeLog
source=("http://downloads.sourceforge.net/project/mailcheck/mailcheck/$pkgver/${pkgname}_$pkgver.tar.gz"
        "001_username.diff"
        "002_advanced_counting.diff"
        "003_no_stripping.diff"
        "series")
md5sums=('d2a3a22a65b1006d213d8cb3f4738070'
         '1ff0ee04682038455d0b3cce3022ecf8'
         'fa32d950e8c4114d3354d6f7c10d2bfd'
         'a8ad59bce56316aa92fc603f7bb2a11c'
         '8a54141f89d45d0fb30ff3d33aee1f12')
sha1sums=('62909555f1afcb411fe097fce6595889dd2c5bcf'
          '97f9539e72704a107ad374ffb10064a283a08f3a'
          '98478d882e374bcbcc5a4ac12541dba4abb0c692'
          '9bbd4ca6a2f6b9040e66dcac1f842824d2133a80'
          '1d43df4b3a7c837ac7ec0aede99f3b00148a5d5f')
sha256sums=('6ca6da5c9f8cc2361d4b64226c7d9486ff0962602c321fc85b724babbbfa0a5c'
            '7ff36e5a58b16ec5b85212be6328103500c3a51dd2ab86f2b483197882e6da51'
            'd225d2f9fbce92398d98567d9648db51ae6769506b424245fb4658c8702da26c'
            'e1a187248e34bfacdf0aca325950cbef09bfc8c1e7ac98db18d737868cb55d78'
            '18ce2ac6ffae8bda72e5ef6821c002743d6d58ec82e0c9089a7e78fb2d81154c')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p patches
  cp ../series patches/
  cp ../*.diff patches/
  quilt push -a
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p $pkgdir/{usr/{bin,share/man/man1},etc}
  make prefix=$pkgdir install
  install -m644 mailcheck.1 $pkgdir/usr/share/man/man1/
}


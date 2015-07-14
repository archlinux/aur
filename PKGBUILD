# Maintainer: Noel Maersk <veox-at-wemakethings-dot-net>
# Contributor: Gergely Tamas <dice-at-mfa-dot-kfki-dot-hu>
# Contributor: Jan Spakula bender02 at archlinux dot us

pkgname=rdup
pkgver=1.1.14
pkgrel=3
pkgdesc="Generates a file list suitable for making backups. Processing tool included."
url="http://archive.miek.nl/projects/rdup"
license=("GPL3")
depends=('glib2' 'pcre' 'libarchive' 'nettle')
arch=('i686' 'x86_64')
source=(http://archive.miek.nl/projects/$pkgname/$pkgname-$pkgver.tar.bz2
        libarchive-depr-fix.patch)
sha1sums=('49dc7570122bfa362f36a26a2ffa8bfe8ad55182'
          '69cd5825f7ec196f3bf906565f373fde9275cfc8')

build() {
  cd $srcdir/$pkgname-$pkgver
  patch -p2 < "$srcdir/libarchive-depr-fix.patch"
  ./configure --prefix=/usr --sysconfdir=/etc
  make -j1
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}

# vim:set ts=2 sw=2 et:

# Maintainer: Phillip Smith <pkgbuild@phs.id.au>
# http://github.com/fukawi2/aur-packages
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: erkaN kaplaN <erkan@linux-sevenler.org>

### I AM ONLY THE PACKAGER, NOT THE DEVELOPER
### Please ask support questions about this software in one of:
###   1) The AUR comments; OR
###   2) Upstream forums/maillist etc; OR
###   3) The ArchLinux forums
### I do not always know enough about the software itself, or don't have the
### time to promptly respond to direct emails.
### If you have found a problem with the package/PKGBUILD (as opposed to
### the software) then please do email me or post an AUR comment.

pkgname=jwhois
pkgver=4.0
pkgrel=2
pkgdesc="An Internet Whois client"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/jwhois/"
license=('GPL3')
depends=('gdbm' 'libidn')
source=("ftp://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.gz"
        "$pkgname.patch")
sha256sums=('fa9bb86782b915c6d730bb723f876dc9b345a617db375aaf3416ec22553cd64e'
            'ae79266541d18ba6a7ca9d5eef9f2187b179c4ad88921ee77c9d369d968d6e26')

prepare() {
  cd "$srcdir"/$pkgname-$pkgver

  patch -Np0 -i "$srcdir"/${pkgname}.patch
}

build() {
  cd "$srcdir"/$pkgname-$pkgver

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc

  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver

  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:

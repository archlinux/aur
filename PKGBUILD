#
# PKGBUILD for daemontools-encore
#
# Contributor: Uffe Jakobsen <uffe@uffe.org>
# Maintainer: Uffe Jakobsen <uffe@uffe.org>
#
pkgname=daemontools-encore
pkgver=1.06
pkgrel=1
epoch=
pkgdesc="collection of tools for managing UNIX services - derived from the public-domain release of daemontools by D. J. Bernstein."
arch=('i686', 'x86_64')
url="http://untroubled.org/daemontools-encore"
license=('unknown')
groups=()
depends=('glibc')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://untroubled.org/daemontools-encore/$pkgname-$pkgver.tar.gz)
#        fastforward-cc-conf.patch)
noextract=()
md5sums=('1db6f1f7c913f728389e384c6340d53c')
#         '7c6ebb4e2e514bebc11296f0a2ee80eb')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  #patch -p1 -i "$srcdir/fastforward-cc-conf.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  echo
  echo "WARNING: self-tests may run for a long time durig this build..."
  echo
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  #make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir "$pkgdir/usr"
  chmod 755 "$pkgdir/usr"

  mkdir "$pkgdir/usr/bin"
  chmod 755 "$pkgdir/usr/bin"
  echo "$pkgdir/usr/bin" > conf-bin

  mkdir "$pkgdir/usr/share"
  chmod 755 "$pkgdir/usr/share"

  mkdir "$pkgdir/usr/share/man"
  chmod 755 "$pkgdir/usr/share/man"
  echo "$pkgdir/usr/share/man" > conf-man

  make DESTDIR="$pkgdir/" install
}

# EOF

# Maintainer: aksr <aksr at t-com dot me>
pkgname=mawk2-git
_pkgver=1.9.9.6
pkgver=1.9.9.6.r6.f1c6a55
pkgrel=1
epoch=
pkgdesc="An interpreter for the AWK Programming Language (from the original author)."
arch=('i686' 'x86_64')
url="https://github.com/mikebrennan000/mawk-2"
license=('GPLv3')
categories=()
groups=()
depends=('')
makedepends=('git')
optdepends=()
checkdepends=()
provides=()
conflicts=("${pkgname%-*}")
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+$url")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "1.9.9.6.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
  tar xzf mawk-${_pkgver}.tar.gz
}

build() {
  cd "$srcdir/$pkgname/mawk-${_pkgver}"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$pkgname/mawk-${_pkgver}"
  make check
}

package() {
  cd "$srcdir/$pkgname/mawk-${_pkgver}"
  #mkdir -p $pkgdir/usr/{bin,share/man/man1}
  #make prefix="$pkgdir/usr" MANDIR="$pkgdir/usr/share/man/man1" install
  install -D -m755 mawk $pkgdir/usr/bin/mawk2
  install -D -m644 man/mawk.1 $pkgdir/usr/share/man/man1/mawk2.1
  install -D -m644 ../about-mawk.pdf $pkgdir/usr/share/doc/${pkgname%-*}/about-mawk.pdf
  install -D -m644 README $pkgdir/usr/share/doc/${pkgname%-*}/README
  install -D -m644 ChangeLog.beebe $pkgdir/usr/share/doc/${pkgname%-*}/ChangeLog.beebe
}


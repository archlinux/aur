# Maintainer: aksr <aksr at t-com dot me>
pkgname=v10spell-git
pkgver=r22.gaf08869
pkgrel=1
epoch=
pkgdesc='The spell program from the Tenth Edition Research UNIX system.'
arch=('i686' 'x86_64')
url='https://github.com/arnoldrobbins/v10spell'
license=('custom')
groups=()
depends=()
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

prepare() {
  cd "$srcdir/$pkgname"
  sed -i 's@/usr/local/lib/v10spell@/usr/lib/v10spell@g' spell.1
}

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^v10.code.from.TUHS.//'
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  make PREFIX="${pkgdir}/usr" LIBDIR="${pkgdir}/usr/lib/v10spell" install
  install -D -m644 README $pkgdir/usr/share/doc/${pkgname%-*}/README
  install -D -m644 README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
  install -D -m644 spell.pdf $pkgdir/usr/share/doc/${pkgname%-*}/spell.pdf
}


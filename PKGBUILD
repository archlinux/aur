# Maintainer: aksr <aksr at t-com dot me>
pkgname=epic4-git
pkgver=2.10.6.r972.a2b9f18
pkgrel=1
epoch=
pkgdesc="A new direction in ircII development."
arch=('i686' 'x86_64')
url="http://www.epicsol.org/"
license=('custom')
categories=()
groups=()
depends=('openssl' 'ncurses' 'tcl' 'perl')
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
source=("$pkgname::git+http://git.epicsol.org/epic4.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "%s.r%s.%s" "$(git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^epic4.//')" \
                     "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  unset CPPFLAGS
  ./configure --prefix=/usr --mandir=/usr/share/man \
              --with-ssl  \
              --with-ipv6 \
              --with-perl \
              --with-tcl
  make
}

package() {
  cd "$srcdir/$pkgname"
  make prefix="${pkgdir}"/usr \
       libexecdir="${pkgdir}"/usr/bin \
       mandir="${pkgdir}"/usr/share/man install
  install -Dm644 COPYRIGHT "${pkgdir}"/usr/share/licenses/${pkgname%-*}/COPYRIGHT
}


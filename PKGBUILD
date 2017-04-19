# Maintainer: aksr <aksr at t-com dot me>
pkgname=ettcp-git
pkgver=r5.6f538a6
pkgrel=1
epoch=
pkgdesc="An ancient version of ttcp from sourceforge, updated for Linux "
arch=('i686' 'x86_64')
url="https://github.com/brho/ettcp"
license=('public-domain')
categories=()
groups=()
depends=('')
makedepends=('git')
optdepends=()
checkdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+https://github.com/brho/ettcp.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p $pkgdir/{usr/{bin,share/man/man1},etc}
  make RPM_INSTALL_DIR="$pkgdir/usr/bin" \
       RPM_MAN_DIR="$pkgdir/"usr/share/man/man1 \
       RPM_ETC_DIR="$pkgdir/"/etc  install
  mv $pkgdir/usr/share/man/man1/man1 $pkgdir/usr/share/man/man1/ettcp.1.gz
  for i in blow speedfrom suck speedto; do
    install -Dm644 ${i}.1 $pkgdir/usr/share/man/man1/$i
  done
  install -Dm644 README $pkgdir/usr/share/doc/${pkgname%-*}/README
}


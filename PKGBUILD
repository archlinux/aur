# Maintainer:
# Contributor: bartus <arch-user-repoᘓbartus.33mail.com>

_pkgname="glew"
pkgname=glew-1.13.0
pkgver=1.13.0
pkgrel=3
pkgdesc='A cross-platform C/C++ extension loading library'
url='http://glew.sourceforge.net'
license=('BSD' 'MIT' 'GPL')
arch=('x86_64')

depends=(
  libgl

  ## implicit
  #glibc
  #libx11
)

provides=('glew1.13=1.13.0')
conflicts=('glew1.13')

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"https://downloads.sourceforge.net/$_pkgname/$_pkgsrc.tgz")
sha256sums=('aa25dc48ed84b0b64b8d41cdd42c8f40f149c37fa2ffa39cd97f42c78d128bc7')

prepare() {
  cd "$_pkgsrc"
  sed -i 's|lib64|lib|' config/Makefile.linux
}

build() {
  cd "$_pkgsrc"
  make
}

package() {
  cd "$_pkgsrc"
  make GLEW_DEST="${pkgdir}/usr" install.all

  # unneeded files
  rm -rf "$pkgdir/usr"/{bin,include,share}
  rm -rf "$pkgdir/usr/lib/pkgconfig"
  rm -f "$pkgdir/usr/lib"/*.a
  rm -f "$pkgdir/usr/lib"/*.so

  # license
  install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# Maintainer: aksr <aksr at t-com dot me>
pkgname=bitchx12-git
pkgver=0+213_3143706
pkgrel=1
pkgdesc="An IRC (Internet Relay Chat) client."
arch=('i686' 'x86_64')
url="http://www.bitchx.ca/"
url="https://github.com/BitchX/BitchX1.2"
license=('GPL2')
groups=()
depends=('openssl')
makedepends=('git' 'cpio')
provides=('bitchx')
conflicts=('ircii-pana' 'bitchx-svn' 'bitchx-git' 'bitchx11-git' 'bitchx13-git')
replaces=()
backup=()
options=()
install=
source=("$pkgname::git+https://github.com/BitchX/BitchX1.2.git")
noextract=()
md5sums=('SKIP')

pkgver () {
  cd "$srcdir/$pkgname"
  echo "0+$(git rev-list --count HEAD)_$(git describe --always )"
}

build() {
  cd "$srcdir/$pkgname"
  ./configure --prefix=/usr --mandir=/usr/share/man --enable-ipv6 --with-plugins --with-ssl
  make 
}

package() {
  cd "$srcdir/$pkgname"
  sed -i 's/\/usr\/local/\/usr/' "$srcdir/$pkgname/doc/BitchX.1"
  make DESTDIR="$pkgdir/" install
}


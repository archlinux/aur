# Maintainer: aksr <aksr at t-com dot me>
pkgname=bitchx-git
pkgver=0+24_e60bfb7
pkgrel=1
pkgdesc="An IRC (Internet Relay Chat) client."
arch=('i686' 'x86_64')
#url="http://www.bitchx.ca/"
url="https://github.com/BitchX/BitchX"
license=('GPL2')
groups=()
depends=('openssl')
makedepends=('git' 'cpio')
provides=()
conflicts=('ircii-pana' 'bitchx-svn' 'bitchx11-git' 'bitchx12-git' 'bitchx13-git')
replaces=()
backup=()
options=()
install=
source=("$pkgname::git+https://github.com/BitchX/BitchX.git")
noextract=()
md5sums=('SKIP')

pkgver () {
  cd "$srcdir/$pkgname"
  echo "0+$(git rev-list --count HEAD)_$(git describe --always )"
}

build() {
  cd $srcdir/$pkgname
  ./configure --exec_prefix=/usr      \
              --prefix=/usr           \
              --mandir=/usr/share/man \
              --enable-ipv6           \
              --with-plugins          \
              --with-ssl
  make 
}

package() {
  cd $srcdir/$pkgname
  make DESTDIR="$pkgdir/" install
}


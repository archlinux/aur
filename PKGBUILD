# Maintainer: aksr <aksr at t-com dot me>
pkgname=bitchx-git
pkgver=1.2.1.r118.gdc17b05
pkgrel=1
pkgdesc="An IRC (Internet Relay Chat) client."
arch=('i686' 'x86_64')
url="http://bitchx.sourceforge.net/"
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
source=("$pkgname::git+git://git.code.sf.net/p/bitchx/git")
noextract=()
md5sums=('SKIP')

pkgver () {
  cd "$srcdir/$pkgname"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^bitchx\.//'
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
  install -Dm644 COPYRIGHT $pkgdir/usr/share/doc/${pkgname%-*}/COPYRIGHT
}


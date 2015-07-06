# Contributor:
# Maintainer: aksr <aksr at t-com dot me>
pkgname=suck
pkgver=4.3.2
pkgrel=3
pkgdesc='Download news from remote NNTP server.'
url='http://linux.maruhn.com/sec/sucks.html'
license=('CPL')
arch=('i686' 'x86_64')
depends=('openssl')
optdepends=('perl')
source=("ftp://sunsite.unc.edu/pub/Linux/system/news/transport/${pkgname}-${pkgver}.tar.gz")
md5sums=('b4de28e7f256ec3c2c388b2c984f30bf')
sha1sums=('8c48889e407473ab565a3d8ba5cda969862d216a')
sha256sums=('c98dd04d1fe6914867fa509821243d5e63d1159a238f38f6c01e19e266b51788')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --mandir=\$prefix/share/man
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make prefix=$pkgdir/usr install

  # documentation and samples
  mkdir -p $pkgdir/usr/share/doc/suck
  cp -r CHANGELOG README README.Xover sample/suckkillfile.sample \
    sample/sucknewsrc.sample sample/suckothermsgs.sample \
    $pkgdir/usr/share/doc/suck
  chmod 644 $pkgdir/usr/share/doc/suck/*

  # manpages
  mkdir -p $pkgdir/usr/share/man
  cp -r man/ $pkgdir/usr/share/man/man1
  chmod 644 $pkgdir/usr/share/man/man1/*
}


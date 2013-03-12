# $Id: PKGBUILD 68685 2012-03-31 16:54:07Z arodseth $
# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Christian Neukirchen <chneukirchen@gmail.com>
# Contributor: Thomas Weißschuh <thomas_weissschuh lavabit.com>

pkgname=mosh
pkgver=1.2.3
pkgrel=5
pkgdesc='Mobile shell, surviving disconnects with local echo and line editing'
arch=('x86_64' 'i686')
url='http://mosh.mit.edu/'
license=('GPL3')
depends=('protobuf' 'ncurses' 'zlib' 'openssh' 'perl' 'perl-io-tty' 'libutempter')
source=("https://github.com/downloads/keithw/mosh/$pkgname-$pkgver.tar.gz")
sha256sums=('93f09fda77e57f05485a61f3ac679bf9f3f359a9b0b93c216ddd53cd124a768f')
optdepends=('ufw-extras')
options=('!emptydirs')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
  install -Dm644 "conf/bash_completion.d/$pkgname" \
    "$pkgdir/usr/share/bash-completion/completions/$pkgname"
}

# vim:set ts=2 sw=2 et:

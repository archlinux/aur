# Maintainer: willemw <willemw12@gmail.com>
# Contributor: LinRs <20455421+LinRs AT users.noreply.github.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Christoph 'delmonico' Neuroth <delmonico@gmx.net>

pkgname=snownews
pkgver=1.11
pkgrel=1
pkgdesc="RSS feed reader for the command-line"
arch=('x86_64')
url="https://sourceforge.net/projects/snownews/"
license=('GPL3')
depends=('curl' 'libxml2')
source=("$pkgname-$pkgver.tar.gz::https://sourceforge.net/projects/$pkgname/files/$pkgname-$pkgver.tar.gz")
sha256sums=('afd4db7c770f461a49e78bc36e97711f3066097b485319227e313ba253902467')

build() {
  # Workaround for GCC 12
  export CFLAGS="$CFLAGS -Wno-stringop-truncation -Wno-error=format-security"

  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}

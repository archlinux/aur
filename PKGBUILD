# Contributor: Rasi <rasi13@gmx.de>
# Contributor: archistic <archistic AT archlinux.org>
# Maintainer: archistic <archistic AT archlinux.org>

pkgname=scrobby-git
_pkgname=scrobby
pkgver=20130328
pkgrel=1
pkgdesc="C++ last.fm Client for MPD"
arch=('i686' 'x86_64')
url="http://unkart.ovh.org/scrobby/"
license=('GPL2')
depends=('curl' 'openssl')
install=scrobby.install
makedepends=('git')
options=(!strip)
# Using a fork for the source, since the original does not compile
source=('scrobby.init' 'scrobby.install'
        "$_pkgname::git+https://github.com/wor/scrobby.git")

sha512sums=('2fd940480e7620300cdb53a0678ddc061958667f49e7d665b00ea7583409b7b6d0dc7888ddad0cb581b55c79e91ce3145cfd78fe7d54b004d05c47c62369d240'
            '920adf5f06bf9908b6f891734cef48db5349ec04bac2bfb550fb6067dfdccdb9c59aa48980c1da0fcc7e43f7596f591afabd0a77f746147a06b09532526d71d0'
            'SKIP')

build() {
  cd "$srcdir/$_pkgname"
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir/" install
}

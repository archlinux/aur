# Maintainer: xiretza <xiretza+aur@gmail.com>
# Contributor: Arthur Țițeică arthur.titeica/gmail/com
# Contributor: rockerzz <rockerzz@gmail.com>

pkgname=log4c
pkgver=1.2.4
pkgrel=3
pkgdesc='Logging FrameWork for C, as Log4j or Log4Cpp'
url='http://log4c.sourceforge.net/'
arch=('i686' 'x86_64')
license=('LGPL')
depends=('expat')
source=("http://prdownloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "0001-Fix-compile-with-Werror-format-security.patch")
sha256sums=('5991020192f52cc40fa852fbf6bbf5bd5db5d5d00aa9905c67f6f0eadeed48ea'
            'f85bdfa6525739569ddb1c1f4bbf90de399dc3c95b24b964c8773fa89d17e47f')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  patch -p1 < "$srcdir/0001-Fix-compile-with-Werror-format-security.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr \
              --sysconfdir=/etc/log4c
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="${pkgdir}" install
}


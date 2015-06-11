# Maintainer: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: Mark Rosenstand <mark@archlinux.org>
# Contributor: Nathan Owe <ndowens04+AUR @ gmail.com>

pkgname='gofish'
pkgver='1.2'
pkgrel='1'
pkgdesc='Simple gopher/web server with HTTP support'
license=('GPL-2')
url='http://gofish.sourceforge.net/'
arch=('i686' 'x86_64')
backup=('etc/gofish.conf' 'etc/gofish-www.conf')
provides=('gopherd')
install='gofish.install'

md5sums=('a44fc268354ec97324fa25572910c412'
         '23ff978124baeec51950beb9ff2973ae')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz"
  'gopherd.rc.d')

build() {
  cd "${srcdir}/${pkgname}"

  install -Dm755 $srcdir/gopherd.rc.d \
    $pkgdir/etc/rc.d/gopherd

  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-mmap-cache \
    --with-gopherroot=/var/gopher \
    --with-gopheruser=gopher
  make; make DESTDIR=$pkgdir install
}

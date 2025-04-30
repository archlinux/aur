# Contributor: ConnorBehan <connor.behan@gmail.com>
pkgname=manserver
pkgver=1.08
pkgrel=6
pkgdesc="Man to HTML converter which can act as an HTTP server on port 8888"
arch=('i686' 'x86_64')
url="http://www.squarebox.co.uk/users/rolf/download/manServer.shtml"
license=('custom')
depends=('perl')
optdeps=('gzip: extraction' 'bzip2: extraction')
source=(https://smallperturbation.com/sites/default/files/$pkgname-$pkgver.tar.gz
	manserver.sh manserver.service manserver.rc manpath.config escape_more.diff)

package() {
  mkdir -p "$pkgdir"/usr/share/licenses/$pkgname
  mkdir -p "$pkgdir"/usr/share/man/man1
  mkdir -p "$pkgdir"/usr/bin
  mkdir -p "$pkgdir"/usr/lib/systemd/system
  mkdir -p "$pkgdir"/etc/rc.d

  cd "$srcdir"/manServer
  patch -Np0 -i ../escape_more.diff
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 manServer.1 "$pkgdir"/usr/share/man/man1/manServer.1
  install -Dm755 manServer.pl "$pkgdir"/usr/bin/manServer
  install -Dm755 ../manserver.sh "$pkgdir"/usr/bin/manserver
  install -Dm644 ../manserver.service "$pkgdir"/usr/lib/systemd/system/manserver.service
  install -Dm755 ../manserver.rc "$pkgdir"/etc/rc.d/manserver
  install -Dm644 ../manpath.config "$pkgdir"/etc/manpath.config
}

sha256sums=('a67c55b6a7772d0e827d0769de1b1c8bb03498b55d35f678c0ed52fd9b9fc646'
            '22bca597cbac199599a3ba1938da2f0dedc062fb26f09143ad446aea02e0f42b'
            '5c63105d45dd8b853aa957617a345f66b086826c1ec2b60f3717f47ddb85f63b'
            'f4ec0b78b2635e8ae3c279970b6a02477985edea21681d5e3dcaf64fae20d7e0'
            '7113bff48038addf7780decb83efb0091f8dc85ee216b62bb894aa910da185bb'
            '900f96df3820b389272eb854917816d31a189cc1e3e4ea5e4589674bfd4af176')

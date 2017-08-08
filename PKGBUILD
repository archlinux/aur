pkgname=shadowsocksr-libev
pkgver=2.4.1.366.gbf324d8
pkgrel=1
pkgdesc='A Shadowsocks branches'
arch=('i686' 'x86_64')
url='https://github.com/shadowsocksr/shadowsocksr-libev'
license=('GPL')
conflicts=('shadowsocks-libev')
depends=('libcap' 'mbedtls' 'libev' 'libsodium'
         'udns' 'pcre' 'libcorkipset' 'libbloom')
makedepends=('git' 'gcc' 'autoconf' 'libtool' 'automake' 'make' 'zlib' 'openssl' 'asciidoc' 'xmlto')
options=('docs' '!strip')
source=('git+https://github.com/shadowsocksr-backup/shadowsocksr-libev.git'
        shadowsocks-libev-redir@.service
        shadowsocks-libev-server@.service
        shadowsocks-libev-tunnel@.service
        shadowsocks-libev@.service
        )
sha1sums=('SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP')


_gitname='shadowsocksr-libev'

pkgver() {
  cd "$_gitname"
  git describe --tags | sed 's/-/./g'
}

build() {
  cd "$_gitname"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" install
  install -Dm644 "$srcdir/shadowsocks-libev-redir@.service" "$pkgdir/usr/lib/systemd/system/shadowsocks-libev-redir@.service"
  install -Dm644 "$srcdir/shadowsocks-libev-server@.service" "$pkgdir/usr/lib/systemd/system/shadowsocks-libev-server@.service"
  install -Dm644 "$srcdir/shadowsocks-libev-tunnel@.service" "$pkgdir/usr/lib/systemd/system/shadowsocks-libev-tunnel@.service"
  install -Dm644 "$srcdir/shadowsocks-libev@.service" "$pkgdir/usr/lib/systemd/system/shadowsocks-libev@.service"
}





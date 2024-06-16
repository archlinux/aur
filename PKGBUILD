pkgname=convos-git
pkgver=8.07
pkgrel=1
pkgdesc="simplest way to use IRC in your browser."
arch=('x86_64')
url="https://convos.chat/"
license=('Artistic-2.0')
depends=('perl' 'perl-io-socket-ssl' 'openssl')
makedepends=('git')
source=("git+https://github.com/convos-chat/convos.git"
        "convos.service")
sha256sums=('SKIP' 
            '453f0e3404114d97c3b4ddc9f9ae3de559d827c63e2710170735d3317973ccca')
build() {
  cd "$srcdir/convos"
  ./script/convos install
}

package() {
  cd "$srcdir/convos"
  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/convos"
  install -Dm755 script/convos "$pkgdir/usr/bin/convos"
  cp -r . "$pkgdir/usr/share/convos"
  install -Dm644 "$srcdir/convos.service" "$pkgdir/usr/lib/systemd/system/convos.service"
}

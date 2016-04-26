# Maintainer: MattWoelk

pkgname=nessus
pkgver=6.6.1
pkgrel=1
_bigver=Nessus-$pkgver-fc20
pkgdesc='Vulnerability scanner'
arch=('x86_64')
depends=('openssl' 'gnupg')
license=('custom')
url='https://www.nessus.org'
install=nessus.install

# Download the rpm from <http://www.tenable.com/products/nessus/select-your-operating-system>
# Nessus-6.6.1-fc20.x86_64.rpm
./getnessus.sh
source=($_bigver.x86_64.rpm
        nessus.sh
        LICENSE.NESSUS
        nessus.install)
md5sums=('28f86ffcccf03cf87eab80e853fd8abf'
         '8c5772ac63f97d94475fe03e80d6ba5c'
         '8ff98bc9488304fcb66753d3cfb5f30e'
         'd9d25d4075acc50c0050c7a4f244c7cb')
	 package() {
  install -Dm755 $pkgname.sh "$pkgdir/etc/profile.d/$pkgname.sh"

  mkdir -p "$pkgdir/etc/ld.so.conf.d" "$pkgdir/usr/share" "$pkgdir/opt/nessus" \
           "$pkgdir/usr/lib"

  cp -a lib "$pkgdir/usr"

  # path to libraries
  echo /opt/nessus/lib > "$pkgdir/etc/ld.so.conf.d/nessus.conf"

  # main files
  cp -a opt/nessus/{bin,com,etc,lib,sbin,var} "$pkgdir/opt/nessus"

  # license
  install -Dm644 LICENSE.NESSUS "$pkgdir/usr/share/licenses/nessus/LICENSE.NESSUS"
}

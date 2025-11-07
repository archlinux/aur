# Maintainer: kmille github@androidloves.me

pkgname=dovecot-tools-git
pkgver=r24.fa7a2ba
pkgrel=1
provides=("dovecot-tools")
conflicts=("dovecot-tools")
pkgdesc="tools to decrypt encrypted dovecot emails (with lz4 support)"
arch=('any')
url="https://github.com/dovecot/tools"
license=('MIT')
depends=(python python-asn1 python-lz4 python-cryptography)
makedepends=(git)
source=("git+https://github.com/dovecot/tools.git")
sha256sums=("SKIP")
#source=("https://github.com/dovecot/tools/blob/9d7ad3aefc288ff1dc8ec0bd45ac39a078531064/decompress-dovecot-lz4.py"
#        "https://github.com/dovecot/tools/blob/9d7ad3aefc288ff1dc8ec0bd45ac39a078531064/dcrypt-decrypt.py")
#sha256sums=('9d41fb704fa74d0e1b2d090fc3b744574c46b8b513f19e29992dc99e0739d6d8'
#            '3c95e76e76a3cd52403c55ad694b63347bb6593f1cbd916e6ef677f47c09557e')

pkgver() {
  cd tools
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  install -D "$srcdir/tools/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm 0755 "$srcdir/tools/decompress-dovecot-lz4.py" "$pkgdir/usr/bin/dovecot-decompress-dovecot-lz4"
  # usage: dovecot-dcrypt-decrypt < /tmp/decrypted.eml.lz4 > /tmp/decrypted.eml
  install -Dm 0755 "$srcdir/tools/dcrypt-decrypt.py" "$pkgdir/usr/bin/dovecot-dcrypt-decrypt"
}

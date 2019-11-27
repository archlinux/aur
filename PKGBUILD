pkgname=batch_resolve
pkgver=0.3.7
pkgrel=2
pkgdesc="Fast asynchronous DNS resolver"
arch=('x86_64')
url="https://github.com/mersinvald/batch_resolve"
license=('MIT')
depends=('openssl')

URL=$(curl -s https://api.github.com/repos/mersinvald/batch_resolve/releases/tags/v$pkgver | jq -r ".assets[] | select(.name | test(\"${batch_resolve}\")) | .browser_download_url" | grep .deb$ )
source=($URL)

prepare() {
  tar -zxvf data.tar.gz
}

package() {
  mkdir -p $pkgdir/usr/bin/
  mkdir -p $pkgdir/etc/
  
  install -m 755 $srcdir/usr/bin/batch_resolve $pkgdir/usr/bin/batch_resolve
  install -m 755 $srcdir/etc/batch_resolve.toml $pkgdir/etc/batch_resolve.toml
  
  chmod +x $pkgdir/usr/bin/batch_resolve
  chmod -x $pkgdir/etc/batch_resolve.toml
}

md5sums=('27fb723320d9908d2f84368f42325517')

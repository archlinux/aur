pkgname=batch_resolve
pkgver=0.3.5
pkgrel=1
pkgdesc="Fast asynchronous DNS resolver"
arch=('x86_64')
url="https://github.com/mersinvald/batch_resolve"
license=('MIT')
depends=('openssl')

URL=$(curl -s https://api.github.com/repos/mersinvald/batch_resolve/releases/tags/$pkgver | jq -r ".assets[] | select(.name | test(\"${batch_resolve}\")) | .browser_download_url" | grep .deb$ )
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
md5sums=('0840cfb4d7ad400aab0d10fb3e50b17f')

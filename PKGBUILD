# Maintainer: maximumadmin <mxmadm@protonmail.com>

pkgname=zramd
pkgver=0.8.2
pkgrel=1
pkgdesc="Automatically setup swap on zram"
arch=('any')
url="https://github.com/maximumadmin/zramd"
license=('MIT')
depends=('util-linux')
makedepends=('go')
conflicts=('systemd-swap' 'zramswap' 'zram-generator' 'zram-generator-git')
source=("https://github.com/maximumadmin/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('610f260e839ce17962c88dfee435a166a241cf2568df7619260dc432d060b380')

prepare() {
  cd "$pkgname-$pkgver"
  go mod download
}

build() {
  cd "$pkgname-$pkgver"
  make release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 ${pkgname}.bin "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 extra/${pkgname}.service -t "${pkgdir}/usr/lib/systemd/system/"       
  install -Dm644 extra/env "${pkgdir}/etc/default/${pkgname}"                          
}

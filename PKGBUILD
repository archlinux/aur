# Maintainer: DuckSoft <realducksoft at gmail dot com>
# Contributor: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=ventoy
pkgver=1.0.08
pkgrel=3
pkgdesc='A new multiboot USB solution'
url='http://www.ventoy.net/'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('bash' 'util-linux')
source=("https://github.com/ventoy/Ventoy/releases/download/v${pkgver}/ventoy-${pkgver}-linux.tar.gz"
        'ventoy')
sha512sums=('4b2e1e4bbe33cd08758bc7d7ca6a9518f3c4c8a4a6002c9b5c98e7b87e9453b2b3162c01bb2b751851a582b0e4e352dc042613f10a9e51c8672abc3c5f10f227'
            '714e97b24a0dca148e6579ee87697bed8b8d4339241973fb430b2a8a087e48458b6d8f3dc52535fd843045091735831b8adae81c503eeeb04998759017a03e9d')

prepare() {
  cd "${pkgname}-${pkgver}"

  msg2 "Patching log.txt stuff..."
  sed -i '/log\.txt/s/.*/true/' tool/ventoy_lib.sh
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm644 boot/* -t "$pkgdir"/opt/ventoy/boot/
  install -Dm644 ventoy/* -t "$pkgdir"/opt/ventoy/ventoy/
  install -Dm755 tool/* -t "$pkgdir"/opt/ventoy/tool/
  install -Dm755 Ventoy2Disk.sh -t "$pkgdir"/opt/ventoy/

  install -Dm755 ../ventoy -t "$pkgdir"/usr/bin/
}

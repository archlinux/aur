# Maintainer: DuckSoft <realducksoft at gmail dot com>
# Contributor: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=ventoy
pkgver=1.0.12
pkgrel=1
pkgdesc='A new multiboot USB solution'
url='http://www.ventoy.net/'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('bash' 'util-linux')
source=("https://github.com/ventoy/Ventoy/releases/download/v${pkgver}/ventoy-${pkgver}-linux.tar.gz"
        'ventoy')
sha512sums=('b89c4de490ec7af8358c98c7613ba2cb91e42c2db0c7e541ac62e1b3d9dfb7ff2d7550c72a71e52b0e27f7b030053e62b1b3bde3ed93fe7b00be78d4abe00865'
            '27fef4c8e254863896888cf3e77a39ed377100effc69a4518fe55038069c7c1e8b56f1a79d47d969eda8e5bd90920e93b34dd361aac67be948266d1e7b238dcd')

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

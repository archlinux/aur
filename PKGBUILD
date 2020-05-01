# Maintainer: DuckSoft <realducksoft at gmail dot com>
# Contributor: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=ventoy
pkgver=1.0.08
pkgrel=4
pkgdesc='A new multiboot USB solution'
url='http://www.ventoy.net/'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('bash' 'util-linux')
source=("https://github.com/ventoy/Ventoy/releases/download/v${pkgver}/ventoy-${pkgver}-linux.tar.gz"
        'ventoy')
sha512sums=('4b2e1e4bbe33cd08758bc7d7ca6a9518f3c4c8a4a6002c9b5c98e7b87e9453b2b3162c01bb2b751851a582b0e4e352dc042613f10a9e51c8672abc3c5f10f227'
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

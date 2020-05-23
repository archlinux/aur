# Maintainer: DuckSoft <realducksoft at gmail dot com>
# Contributor: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=ventoy
pkgver=1.0.11
pkgrel=1
pkgdesc='A new multiboot USB solution'
url='http://www.ventoy.net/'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('bash' 'util-linux')
source=("https://github.com/ventoy/Ventoy/releases/download/v${pkgver}/ventoy-${pkgver}-linux.tar.gz"
        'ventoy')
sha512sums=('11b91d2f9d9ea941597e6211b5a2df3f03c08b0aedd9538571a53985fc8484507c0bbc572f3619d19bb4c7b5bf8ad62cc2fe516c9b4353d7d826c9de6c169923'
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

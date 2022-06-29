pkgname=realm
pkgver=2.4.0
pkgrel=1
pkgdesc="A simple, high performance relay server written in rust."
url="https://github.com/zhboner/realm"
arch=(x86_64)
license=(MIT)
makedepends=(cargo-nightly)
source=("https://github.com/zhboner/realm/archive/refs/tags/v$pkgver.tar.gz"
"realm.service"
"realm@.service")
sha512sums=('f2a513e58183e57c5cd470cf4e8959ed93173ef9b9dd9d919c03e6388f50015f9dc5c3c2a33c7d75c330835e40678301a54af4e557e7dda0464662fe37114108'
            'bc7f6ad263e9d34caf5d07a6c76b1833a18a1ab52e8b1813d6227ffb286d714efe0272931b9afc4c1db0994fbe65b445392a61657c1447b6145decef4a2ebc32'
            '61a61c7f16fe175f38d6dbef56a6e0b9ac6d66dc3d8627a8a70f921177027d9160ce45e1b6ca4034117e053ea79d13a02ceacfd8ce9ef3a15373ca989192fef8')

build() {
  cd $pkgname-$pkgver
  cargo build --release
}

package() {
  cd $pkgname-$pkgver
  install -Dt "$pkgdir/usr/bin" target/release/$pkgname
  install -Dt "$pkgdir/usr/share/doc/$pkgname" -m644 readme.md
  install -Dm644 "examples/full.json" "$pkgdir/etc/realm/config.json"
  cp examples/*.json "$pkgdir/etc/realm/"
  cd $srcdir
  install -Dt "$pkgdir/usr/lib/systemd/system" realm.service
  install -Dt "$pkgdir/usr/lib/systemd/system" realm@.service
}

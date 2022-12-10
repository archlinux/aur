pkgname=realm
pkgver=2.4.5
pkgrel=1
pkgdesc="A simple, high performance relay server written in rust."
url="https://github.com/zhboner/realm"
arch=(x86_64)
license=(MIT)
makedepends=(cargo-nightly)
source=("https://github.com/zhboner/realm/archive/refs/tags/v$pkgver.tar.gz"
"realm.service"
"realm@.service")
sha512sums=('2ebb9a1b17a738a31bda18d7b28494ea8cb057f56e4920ca2a72ee890e19ed769eb73d2c565d36deb56c84e8a83f1685d599e3b175adebfd6456959439f8f694'
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

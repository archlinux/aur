# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=hush3-bin
_pkgname=hush3
pkgver=3.6.1
pkgrel=1
pkgdesc='HUSH (Privacy Cryptocurrency and Messenger) full node that supports z-addresses'
url='http://git.hush.is/hush/hush3'
arch=('x86_64')
license=('GPL3')
depends=('libsodium' 'lib32-zlib')
makedepends=('wget' 'git' 'curl')
conflicts=('hush3')
source=("$_pkgname-$pkgver.tar.gz::https://git.hush.is/jahway603/arch-bins/raw/branch/master/hush3/hush3_v3_6_1.tar.gz"
        "$url/raw/branch/master/LICENSE")
sha256sums=('c2acf75036b74bc092c47e1fc3f8a80bd6f72a9e230f7edc06b72412f99a0048'
            '6eae06cda3a8320e607ac0ee96cbdfc52b977463151ff4d5b119a26ee0cf666d')
yeah="${_pkgname}_v3_6_1"

build() {
  tar xzvf $_pkgname-$pkgver.tar.gz
}

package() {
  install -Dm644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

  cd "$_pkgname_v3_6_1"
  install -Dm755 "${srcdir}/$yeah/hush-cli" "${pkgdir}/opt/$_pkgname/hush-cli"
  install -Dm755 "${srcdir}/$yeah/hushd" "${pkgdir}/opt/$_pkgname/hushd"
  install -Dm755 "${srcdir}/$yeah/hush-smart-chain" "${pkgdir}/opt/$_pkgname/hush-smart-chain"
  install -Dm755 "${srcdir}/$yeah/hush-tx" "${pkgdir}/opt/$_pkgname/hush-tx"
  install -Dm755 "${srcdir}/$yeah/hush-komodo-cli" "${pkgdir}/opt/$_pkgname/hush-komodo-cli"
  install -Dm755 "${srcdir}/$yeah/hush-komodod" "${pkgdir}/opt/$_pkgname/hush-komodod"
  install -Dm755 "${srcdir}/$yeah/hush-komodo-tx" "${pkgdir}/opt/$_pkgname/hush-komodo-tx"

  # install required sapling files
  install -Dm644 "${srcdir}/$yeah/sapling-output.params" "${pkgdir}/opt/$_pkgname/sapling-output.params"
  install -Dm644 "${srcdir}/$yeah/sapling-spend.params" "${pkgdir}/opt/$_pkgname/sapling-spend.params"

  # links scripts to /usr/bin
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/hush"
  ln -s /opt/$_pkgname/hush-cli "${pkgdir}/usr/bin"
  ln -s /opt/$_pkgname/hushd "${pkgdir}/usr/bin"
  ln -s /opt/$_pkgname/hush-smart-chain "${pkgdir}/usr/bin"
  ln -s /opt/$_pkgname/hush-tx "${pkgdir}/usr/bin"
  ln -s /opt/$_pkgname/hush-komodo-cli "${pkgdir}/usr/bin"
  ln -s /opt/$_pkgname/hush-komodod "${pkgdir}/usr/bin"
  ln -s /opt/$_pkgname/hush-komodo-tx "${pkgdir}/usr/bin"
  ln -s /opt/$_pkgname/sapling-output.params "${pkgdir}/usr/share/hush"
  ln -s /opt/$_pkgname/sapling-spend.params "${pkgdir}/usr/share/hush"
}

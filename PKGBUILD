# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=hush3-bin
_pkgname=hush3
pkgver=3.6.2
pkgrel=1
pkgdesc='HUSH (Privacy Cryptocurrency and Messenger) full node that supports z-addresses'
url='http://git.hush.is/hush/hush3'
arch=('x86_64')
license=('GPL3')
depends=('libsodium' 'lib32-zlib')
makedepends=('wget' 'git' 'curl')
conflicts=('hush3')
source=("$_pkgname-$pkgver.tar.gz::https://git.hush.is/attachments/3f62bccc-259b-4f7a-83c3-a7ede68c9034"
        "$url/raw/branch/master/LICENSE")
sha256sums=('4bc02cc740878d6fb604ae56b02890a0100a8355fa398d7ecc8b666d2f8ab57a'
            '6eae06cda3a8320e607ac0ee96cbdfc52b977463151ff4d5b119a26ee0cf666d')

package() {
  install -Dm644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

  # install required scripts
  install -Dm755 "${srcdir}/hush-cli" "${pkgdir}/opt/$_pkgname/hush-cli"
  install -Dm755 "${srcdir}/hushd" "${pkgdir}/opt/$_pkgname/hushd"
  install -Dm755 "${srcdir}/hush-smart-chain" "${pkgdir}/opt/$_pkgname/hush-smart-chain"
  install -Dm755 "${srcdir}/hush-tx" "${pkgdir}/opt/$_pkgname/hush-tx"
  install -Dm755 "${srcdir}/komodo-cli" "${pkgdir}/opt/$_pkgname/hush-komodo-cli"
  install -Dm755 "${srcdir}/komodod" "${pkgdir}/opt/$_pkgname/hush-komodod"
  install -Dm755 "${srcdir}/komodo-tx" "${pkgdir}/opt/$_pkgname/hush-komodo-tx"

  # install required sapling files and asmap.dat
  install -Dm644 "${srcdir}/sapling-output.params" "${pkgdir}/opt/$_pkgname/sapling-output.params"
  install -Dm644 "${srcdir}/sapling-spend.params" "${pkgdir}/opt/$_pkgname/sapling-spend.params"
  install -Dm644 "${srcdir}/asmap.dat" "${pkgdir}/opt/$_pkgname/asmap.dat"

  # create symlinks
  install -d "${pkgdir}/usr/bin"
  ln -s /opt/${_pkgname}/hush-cli "${pkgdir}/usr/bin"
  ln -s /opt/${_pkgname}/hushd "${pkgdir}/usr/bin"
  ln -s /opt/${_pkgname}/hush-smart-chain "${pkgdir}/usr/bin"
  ln -s /opt/${_pkgname}/hush-tx "${pkgdir}/usr/bin"
  ln -s /opt/${_pkgname}/hush-komodo-cli "${pkgdir}/usr/bin"
  ln -s /opt/${_pkgname}/hush-komodod "${pkgdir}/usr/bin"
  ln -s /opt/${_pkgname}/hush-komodo-tx "${pkgdir}/usr/bin"

  install -d "${pkgdir}/usr/share/hush"
  ln -s /opt/${_pkgname}/sapling-output.params "${pkgdir}/usr/share/hush"
  ln -s /opt/${_pkgname}/sapling-spend.params "${pkgdir}/usr/share/hush"
  ln -s /opt/${_pkgname}/asmap.dat "${pkgdir}/usr/share/hush"
}

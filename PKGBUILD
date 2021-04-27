# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=hush3-bin
_pkgname=hush3
pkgver=3.7.1
pkgrel=1
pkgdesc='HUSH (Privacy Cryptocurrency and Messenger) full node that supports z-addresses'
url='http://git.hush.is/hush/hush3'
arch=('x86_64')
license=('GPL3')
depends=('libsodium' 'lib32-zlib')
makedepends=('wget' 'git' 'curl')
conflicts=('hush3')
source=("hush-$pkgver-amd64.deb::https://git.hush.is/attachments/22856a9f-f1b0-4d41-a832-772864a8a617"
        "$url/raw/branch/master/LICENSE")
sha256sums=('2485642848322318b477f80ff16c72b1c2288bd510fd2c36f134eec2fb596889'
            '6eae06cda3a8320e607ac0ee96cbdfc52b977463151ff4d5b119a26ee0cf666d')

package() {
  # extract from deb file
  tar -xf "$srcdir/data.tar.xz"

  install -Dm644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

  # install required scripts
  install -Dm755 "${srcdir}/usr/bin/hush-cli" "${pkgdir}/opt/$_pkgname/hush-cli"
  install -Dm755 "${srcdir}/usr/bin/hushd" "${pkgdir}/opt/$_pkgname/hushd"
  #install -Dm755 "${srcdir}/usr/bin/hush-smart-chain" "${pkgdir}/opt/$_pkgname/hush-smart-chain" # missing from this release
  install -Dm755 "${srcdir}/usr/bin/hush-tx" "${pkgdir}/opt/$_pkgname/hush-tx"
  install -Dm755 "${srcdir}/usr/bin/hush-komodo-cli" "${pkgdir}/opt/$_pkgname/hush-komodo-cli"
  install -Dm755 "${srcdir}/usr/bin/hush-komodod" "${pkgdir}/opt/$_pkgname/hush-komodod"
  install -Dm755 "${srcdir}/usr/bin/hush-komodo-tx" "${pkgdir}/opt/$_pkgname/hush-komodo-tx"

  # install required sapling files and asmap.dat
  install -Dm644 "${srcdir}/usr/share/hush/sapling-output.params" "${pkgdir}/opt/$_pkgname/sapling-output.params"
  install -Dm644 "${srcdir}/usr/share/hush/sapling-spend.params" "${pkgdir}/opt/$_pkgname/sapling-spend.params"
  install -Dm644 "${srcdir}/usr/share/hush/asmap.dat" "${pkgdir}/opt/$_pkgname/asmap.dat"

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

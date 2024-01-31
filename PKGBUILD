_pkgname=sui
pkgname=$_pkgname-bin
pkgver=1.17.3
pkgrel=1
pkgdesc='Sui, a next-generation smart contract platform with high throughput, low latency, and an asset-oriented programming model powered by the Move programming language. (official binary)'
url='https://sui.io'
arch=('x86_64')
license=('Apache-2.0')
depends=('rust' 'openssl' 'libldap' 'krb5' 'e2fsprogs' 'keyutils' 'libsasl')
provides=('sui')
conflicts=('sui')
source=(https://github.com/MystenLabs/$_pkgname/releases/download/mainnet-v$pkgver/$_pkgname-mainnet-v$pkgver-ubuntu-x86_64.tgz)
sha512sums=('a4dc83dbc01c21eb39c95e63ea601f954619c068a501036c6d7bd2577ef99556c7fe50ae85496dfe4fea19d0ceee8dcbcdc6f81a90c041f6fb0940f2d6d5418d')

package() {
  suffix='-ubuntu-x86_64'
  for dir in 'target/release' 'external-crates/move/target/release'; do
    for file in $dir/*; do
        filename=$(basename "$file" "$suffix")
        install -Dm755 "$file" "${pkgdir}/usr/bin/$filename"
    done
  done
}

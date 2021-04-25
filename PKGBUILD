# Maintainer: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>
pkgname=cloud-buster
pkgver=1.5
pkgrel=1
pkgdesc="A cloudflare-resolver"
arch=('any')
url="https://github.com/SageHack/cloud-buster"
license=('GPL3')
depends=('python>=3.5' 'python-dnspython' 'openssl')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/${pkgver}.tar.gz"
        "cloud-buster.sh")
sha512sums=('5190c59828f0018a2c1ac6addeeafdce5e391695f07bff8f2cddbc7da2652db54eda4c5e79b24d5457630491db09fc599741c31c23029aefb164bf7d357b0578'
            'bb773d1c650e1667a91aa67d9bbf1ae683e190a6f2a320665dc077ac8fdedd95294721f9e0f2c7a6adc195ab2873d7638b62bca0656a0bf33fe8539fc890d49c')

build() {
  cd "${pkgname}-${pkgver}"
  python -O -m compileall .
}

package() {
  install -Dvm 755 cloud-buster.sh "$pkgdir/usr/bin/cloud-buster"
  cd "$pkgname-$pkgver"
  find bust crimeflare lists \
    -type f -exec install -Dvm 755 '{}' "$pkgdir/usr/share/$pkgname/{}" \;
}

# vim:set et sw=2 ts=2 tw=79:

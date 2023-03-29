# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=naabu-bin
_pkg="${pkgname%-bin}"
pkgver=2.1.5
pkgrel=1
pkgdesc='Fast port scanner with a focus on reliability and simplicity'
arch=('x86_64')
url='https://github.com/projectdiscovery/naabu'
license=('MIT')
depends=('libpcap')
provides=("$_pkg")
conflicts=("$_pkg")
source=('LICENSE'
        "naabu-README-$pkgver::https://raw.githubusercontent.com/projectdiscovery/naabu/v$pkgver/README.md")
source_x86_64=("$pkgname-$pkgver.zip::$url/releases/download/v$pkgver/naabu_${pkgver}_linux_amd64.zip")
sha256sums=('cbcdaab87df3175107aa28915bd253cebdd618a49c9ac5d6c669c0b1cbebcacb'
            '464f32be9c597d126762acd619f1b95b7ce2ece456931d5965c34150e69e1e17')
sha256sums_x86_64=('9dc06e8e7bc6de1c63d1eb85c015bea89a9f06a432c71e1cc6f35aab139fba26')

package() {
  install -Dv naabu -t "$pkgdir/usr/bin"
  install -dv "$pkgdir/usr/lib/"
  ## ugly hack to fix deps issue
  ln -sv "/usr/lib/libpcap.so" "$pkgdir/usr/lib/libpcap.so.0.8"
  install -Dvm644 "naabu-README-$pkgver" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dvm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim: ts=2 sw=2 et:

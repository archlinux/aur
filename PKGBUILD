# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=naabu-bin
_pkg="${pkgname%-bin}"
pkgver=2.1.3
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
            'b82f2721a551889c6f37b4a8cef217cde9fe81de72fd89cd39fa1fa5d922d779')
sha256sums_x86_64=('e32c5ec3944122dec4b68863e8de7a65f4b5c8ea2ce2ac2d9d67ed3433bc45ce')

package() {
  install -Dv naabu -t "$pkgdir/usr/bin"
  install -dv "$pkgdir/usr/lib/"
  ## ugly hack to fix deps issue
  ln -sv "/usr/lib/libpcap.so" "$pkgdir/usr/lib/libpcap.so.0.8"
  install -Dvm644 "naabu-README-$pkgver" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dvm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim: ts=2 sw=2 et:

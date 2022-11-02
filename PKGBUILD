# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=naabu-bin
_pkgname="${pkgname%-bin}"
pkgver=2.1.1
pkgrel=1
pkgdesc='Fast port scanner with a focus on reliability and simplicity'
arch=('x86_64')
url='https://github.com/projectdiscovery/naabu'
license=('MIT')
depends=('libpcap')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=('LICENSE'
        "README-$pkgver::https://raw.githubusercontent.com/projectdiscovery/naabu/v$pkgver/README.md")
source_x86_64=("$pkgname-$pkgver.zip::$url/releases/download/v$pkgver/naabu_${pkgver}_linux_amd64.zip")
sha256sums=('cbcdaab87df3175107aa28915bd253cebdd618a49c9ac5d6c669c0b1cbebcacb'
            '46a4c1e2965ef28e7c21441bfeb21f428033d3089fa85d614d68ce7cf37d6908')
sha256sums_x86_64=('23fed22c23c90bfd05cb97c268624defa2c478c810ad113c8eb9bcf7258679d2')

package() {
  install -Dv naabu -t "$pkgdir/usr/bin"
  install -dv "$pkgdir/usr/lib/"
  ## ugly hack to fix deps issue
  ln -sv "/usr/lib/libpcap.so" "$pkgdir/usr/lib/libpcap.so.0.8"
  install -Dvm644 "README-$pkgver" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dvm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim: ts=2 sw=2 et:

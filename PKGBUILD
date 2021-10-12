# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=naabu-bin
_pkgname="${pkgname%-bin}"
pkgver=2.0.5
pkgrel=1
pkgdesc='Fast port scanner with a focus on reliability and simplicity'
arch=('x86_64')
url='https://github.com/projectdiscovery/naabu'
license=('MIT')
depends=('libpcap')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("LICENSE-$pkgver::https://raw.githubusercontent.com/projectdiscovery/naabu/v$pkgver/LICENSE.md"
        "README-$pkgver::https://raw.githubusercontent.com/projectdiscovery/naabu/v$pkgver/README.md")
source_x86_64=("$pkgname-$pkgver.zip::$url/releases/download/v$pkgver/${_pkgname}_${pkgver}_linux_amd64.zip")
sha256sums=('cbcdaab87df3175107aa28915bd253cebdd618a49c9ac5d6c669c0b1cbebcacb'
            'd1e930d7040970e70b1e5ea7fe5a4652f833dcdc7f0771eeca361d1aff20e3f5')
sha256sums_x86_64=('6bdca81f5d722be8bb5261e7147354058253d56beb2c61088541aa4de893d7de')

package() {
  install -D naabu -t "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/lib/"
  ## ugly hack to fix deps issue
  ln -s "/usr/lib/libpcap.so" "$pkgdir/usr/lib/libpcap.so.0.8"
  install -Dm644 "README-$pkgver" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE-$pkgver" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:

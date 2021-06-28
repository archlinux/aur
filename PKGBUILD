# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=naabu-bin
_pkgname="${pkgname%-bin}"
pkgver=2.0.4
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
            '2f8b5236d5cd101a9788459a9b5d4ca90b044c0e0a10263908a84fd5e34fad3c')
sha256sums_x86_64=('babd6a42d0f7aea242abdc7dae195ef34177d051e000db2bc8864b5a6e32922e')

package() {
  install -Dm755 naabu -t "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/lib/"
  ## ugly hack to fix deps issue
  ln -s "/usr/lib/libpcap.so" "$pkgdir/usr/lib/libpcap.so.0.8"
  install -Dm644 "README-$pkgver" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE-$pkgver" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:

# Maintainer: tarball <bootctl@gmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=naabu-bin
pkgver=2.3.5
pkgrel=1
pkgdesc='Fast port scanner with a focus on reliability and simplicity'
arch=('x86_64')
url='https://github.com/projectdiscovery/naabu'
license=('MIT')
depends=('libpcap')
provides=('naabu')
conflicts=('naabu')
source=(
  "LICENSE-$pkgver::https://raw.githubusercontent.com/projectdiscovery/naabu/v$pkgver/LICENSE.md"
  "README-$pkgver::https://raw.githubusercontent.com/projectdiscovery/naabu/v$pkgver/README.md"
  "$pkgname-$pkgver.zip::$url/releases/download/v$pkgver/naabu_${pkgver}_linux_amd64.zip"
)
sha256sums=('cbcdaab87df3175107aa28915bd253cebdd618a49c9ac5d6c669c0b1cbebcacb'
            '239d2f4b84e281aa78d65cf3634c807f7f4577af9514692ef9e521154b50402b'
            'b9bdd64883b3f8e3962794889f234ec84e4a563b348ba757a715ee44500e39b5')

package() {
  install -Dv naabu -t "$pkgdir/usr/bin"

  ## ugly hack to fix deps issue
  install -dv "$pkgdir/usr/lib/"
  ln -sv "/usr/lib/libpcap.so" "$pkgdir/usr/lib/libpcap.so.0.8"

  install -Dvm644 "README-$pkgver" "$pkgdir/usr/share/doc/naabu/README.md"
  install -Dvm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/naabu/LICENSE"
}

# vim: ts=2 sw=2 et:

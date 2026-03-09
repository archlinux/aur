# Maintainer: tarball <bootctl@gmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=naabu-bin
pkgver=2.5.0
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
            '958b586bfc2d4b66c87e8e8f9c0e0d53f5499e28af9952338b5fad326efa065a'
            'a401ea3465868fb03802c3d262e0625f9bf34614c8c0e36d08eb67d7e328b366')

package() {
  install -Dv naabu -t "$pkgdir/usr/bin"

  ## ugly hack to fix deps issue
  install -dv "$pkgdir/usr/lib/"
  ln -sv "/usr/lib/libpcap.so" "$pkgdir/usr/lib/libpcap.so.0.8"

  install -Dvm644 "README-$pkgver" "$pkgdir/usr/share/doc/naabu/README.md"
  install -Dvm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/naabu/LICENSE"
}

# vim: ts=2 sw=2 et:

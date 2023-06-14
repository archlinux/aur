# Maintainer: tarball <bootctl@gmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=naabu-bin
pkgver=2.1.6
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
            '385199c924e6e45b9ff5ebe2a204551b9d9450abeea5ddcda2e3c51dbea2bfd6'
            '5e1d437760c56570e3cf169649500dd08aa596991806192d36425764e5e601b6')

package() {
  install -Dv naabu -t "$pkgdir/usr/bin"

  ## ugly hack to fix deps issue
  install -dv "$pkgdir/usr/lib/"
  ln -sv "/usr/lib/libpcap.so" "$pkgdir/usr/lib/libpcap.so.0.8"

  install -Dvm644 "README-$pkgver" "$pkgdir/usr/share/doc/naabu/README.md"
  install -Dvm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/naabu/LICENSE"
}

# vim: ts=2 sw=2 et:

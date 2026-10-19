# Maintainer: TheElevatedOne <adam.mlady@elevated.ovh>

pkgname=k86-software-bin
_pkgname=k86-software
_tarname=attackshark-k86
pkgver=0.2.0
pkgrel=1
pkgdesc='Configuration software for the Attack Shark K86 keyboard (CLI and GTK 3 GUI, prebuilt)'
arch=('x86_64' 'aarch64')
url='https://github.com/TheElevatedOne/K86-Software-Linux'
license=('GPL-3.0-only')
depends=('gcc-libs' 'glibc' 'gtk3')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname" "$_tarname")
# The release binaries are already stripped.
options=('!debug' '!strip')
# Release tags have no "v" prefix.
source_x86_64=("$url/releases/download/$pkgver/$_tarname-$pkgver-linux-x86_64.tar.gz")
source_aarch64=("$url/releases/download/$pkgver/$_tarname-$pkgver-linux-aarch64.tar.gz")
sha256sums_x86_64=('111abf6a85482e4c8e7f54cadf0b50b53be65a2d5cfaf39d9f8149c1c72e1dcc')
sha256sums_aarch64=('eb150ab528204b15629afcab86549655a87fb706e9ad72fa92cf97cb8a068403')

package() {
  cd "$_tarname-$pkgver-linux-$CARCH"
  install -Dm755 bin/k86ctl bin/k86-gui -t "$pkgdir/usr/bin"
  install -Dm644 lib/udev/rules.d/70-attackshark-k86.rules -t "$pkgdir/usr/lib/udev/rules.d"
  # Desktop entry and icons
  find share -type f -exec install -Dm644 {} "$pkgdir/usr/{}" \;
  install -Dm644 README.md PROTOCOL.md CHANGELOG.md -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

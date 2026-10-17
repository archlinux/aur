# Maintainer: TheElevatedOne <adam.mlady@elevated.ovh>

pkgname=k86-software-bin
_pkgname=k86-software
_tarname=attackshark-k86
pkgver=0.1.1
pkgrel=1
pkgdesc='Configuration software for the Attack Shark K86 keyboard (CLI and GTK 3 GUI, prebuilt)'
arch=('x86_64' 'aarch64')
url='https://github.com/TheElevatedOne/AttackSharkKeyboardSoftware'
license=('GPL-3.0-only')
depends=('gcc-libs' 'glibc' 'gtk3')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname" "$_tarname")
# The release binaries are already stripped.
options=('!debug' '!strip')
# Release tags have no "v" prefix.
source_x86_64=("$url/releases/download/$pkgver/$_tarname-$pkgver-linux-x86_64.tar.gz")
source_aarch64=("$url/releases/download/$pkgver/$_tarname-$pkgver-linux-aarch64.tar.gz")
sha256sums_x86_64=('6bece6a2f26d25eac98c317459819fd8facb9d44380904ce39d557a93f9b13db')
sha256sums_aarch64=('18f98ff7f0c9da6d60f67ecb823f278208ec584c00b6cc60f7697ab0a55a8f22')

package() {
  cd "$_tarname-$pkgver-linux-$CARCH"
  install -Dm755 bin/k86ctl bin/k86-gui -t "$pkgdir/usr/bin"
  install -Dm644 lib/udev/rules.d/70-attackshark-k86.rules -t "$pkgdir/usr/lib/udev/rules.d"
  # Desktop entry and icons
  find share -type f -exec install -Dm644 {} "$pkgdir/usr/{}" \;
  install -Dm644 README.md PROTOCOL.md CHANGELOG.md -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

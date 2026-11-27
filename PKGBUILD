# Maintainer: TheElevatedOne <adam.mlady@elevated.ovh>

pkgname=7zipl-bin
_pkgname=7zipl
pkgver=0.1.0
pkgrel=1
pkgdesc='7-Zip File Manager for Linux with a plain GTK 4 interface, using the system 7-Zip library (prebuilt)'
arch=('x86_64')
url='https://github.com/TheElevatedOne/7zipl'
license=('LGPL-2.1-or-later')
depends=('7zip' 'glib2' 'glibc' 'gtk4' 'libgcc' 'libstdc++')
provides=("7zipl=$pkgver")
conflicts=('7zipl')
# The release binary is built on Arch Linux by the GitHub workflow and already stripped.
options=('!debug' '!strip')
# Release tags have no "v" prefix.
source_x86_64=("$url/releases/download/$pkgver/$_pkgname-$pkgver-linux-x86_64.tar.gz")
sha256sums_x86_64=('add35ca71d7a2cc1494539a712a64739555588fc57c42bff7f3456d54d8a4436')

package() {
  cd "$_pkgname-$pkgver-linux-$CARCH"
  install -Dm755 bin/7zipl -t "$pkgdir/usr/bin"
  find share -type f -exec install -Dm644 {} "$pkgdir/usr/{}" \;
  install -Dm644 README.md CHANGELOG.md -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
}

# Maintainer: Amir Zarrinkafsh <nightah at me dot com>
pkgname=authelia-bin
_pkgname=authelia
pkgver=4.39.17
pkgrel=1
pkgdesc="The Cloud ready multi-factor authentication portal for your Apps. Pre-compiled."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/authelia/authelia"
license=('Apache-2.0')
provides=('authelia')
conflicts=(
  'authelia'
  'authelia-git'
)
backup=('etc/authelia/configuration.yml')

source_x86_64=("https://github.com/$_pkgname/$_pkgname/releases/download/v$pkgver/$_pkgname-v$pkgver-linux-amd64.tar.gz")
source_aarch64=("https://github.com/$_pkgname/$_pkgname/releases/download/v$pkgver/$_pkgname-v$pkgver-linux-arm64.tar.gz")
source_armv7h=("https://github.com/$_pkgname/$_pkgname/releases/download/v$pkgver/$_pkgname-v$pkgver-linux-arm.tar.gz")

sha256sums_x86_64=('4a1f2d45f890d777b5a6798a5350b87119a03e0231eae2bdde419916d7b7fbc3')
sha256sums_aarch64=('7f99b1522f1d92973bf6790172ac31e9999dd4b2aed415016a6388bd00007d13')
sha256sums_armv7h=('94a58dafdc5809a7074c7cf227eb87a9cddc1ab4fdc657032d3cbe30e4dd2eb7')

package() {
  install -Dm644 "$srcdir/$_pkgname.service" "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
  install -Dm644 "$srcdir/$_pkgname@.service" "$pkgdir/usr/lib/systemd/system/$_pkgname@.service"
  install -Dm644 "$srcdir/$_pkgname.sysusers.conf" "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
  install -Dm644 "$srcdir/$_pkgname.tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"
  install -Dm644 "$srcdir/$_pkgname.tmpfiles.config.conf" "$pkgdir/usr/lib/tmpfiles.d/$_pkgname-config.conf"
  install -Dm440 "$srcdir/config.template.yml" "$pkgdir/etc/$_pkgname/configuration.yml"
  install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}

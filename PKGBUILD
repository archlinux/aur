# Maintainer: sabuj <contact.sabuj@proton.me>
pkgname=smol-snapper
pkgver=1.1
pkgrel=1
pkgdesc="A standalone bootable btrfs snapshot creation tool"
arch=('any')
url="https://github.com/sabuj66/$pkgname"
license=('GPL-3.0-only')
depends=('btrfs-progs' 'limine')
optdepends=(
  'sbctl: Secure Boot signing'
  'sbsigntools: Secure Boot signing'
  'systemd: stub provider'
  'dbus: notification dependency'
  'fyi: notification functionality'
  'libnotify: notification functionality'
)
source=("$pkgname::https://github.com/sabuj66/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('aef3133a2be7e0fa420783856f2a1944c4322c5e976c645c5f518b92bafb3a58')

backup=('etc/smol-snapper.conf')
package() {
        cd "$srcdir/$pkgname-$pkgver"
        install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
        install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
        install -Dm644 "$pkgname.conf" "$pkgdir/etc/$pkgname.conf"
        install -Dm644 "resources/systemd/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
        install -Dm644 "resources/systemd/$pkgname.timer" "$pkgdir/usr/lib/systemd/system/$pkgname.timer"
}
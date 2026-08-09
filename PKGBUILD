# Maintainer: sabuj <contact.sabuj@proton.me>
pkgname=smol-snapper
pkgver=1.2
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
sha256sums=('0cd53d8ebb15dccb7a6c110e85f1652f6c47660fa02dad18f272849331b436e6')

backup=('etc/smol-snapper.conf')
package() {
        cd "$srcdir/$pkgname-$pkgver"
        install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
        install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
        install -Dm644 "$pkgname.conf" "$pkgdir/etc/$pkgname.conf"
        install -Dm644 "resources/systemd/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
        install -Dm644 "resources/systemd/$pkgname.timer" "$pkgdir/usr/lib/systemd/system/$pkgname.timer"
}
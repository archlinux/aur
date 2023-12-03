# Maintainer: honjow <honjow@gmail.com>

pkgname=frzr-sk
pkgver=0.14.15.dev
pkgrel=1
pkgdesc="A deployment and update system for read-only btrfs subvolume based operating systems"
arch=('any')
provides=('frzr')
conflicts=('frzr')
url="https://github.com/honjow/frzr"
license=('MIT')
depends=('btrfs-progs' 'parted' 'libnewt' 'dosfstools' 'jq' 'util-linux')
source=("$pkgname-$pkgver.tar.gz::https://github.com/honjow/frzr/archive/$pkgver.tar.gz")
md5sums=('SKIP')
backup=('etc/github_cdn.conf' 'etc/frzr-sk.conf')

package() {
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/etc/systemd/system"
  install -m 755 "$srcdir/frzr-$pkgver/frzr-bootstrap" "$pkgdir/usr/bin"
  install -m 755 "$srcdir/frzr-$pkgver/frzr-deploy" "$pkgdir/usr/bin"
  install -m 755 "$srcdir/frzr-$pkgver/__frzr-deploy" "$pkgdir/usr/bin"
  install -m 755 "$srcdir/frzr-$pkgver/frzr-release" "$pkgdir/usr/bin"
  install -m 755 "$srcdir/frzr-$pkgver/frzr-unlock" "$pkgdir/usr/bin"
  install -m 755 "$srcdir/frzr-$pkgver/frzr-initramfs" "$pkgdir/usr/bin"
  install -m 755 "$srcdir/frzr-$pkgver/frzr-tweaks" "$pkgdir/usr/bin"
  install -m 644 "$srcdir/frzr-$pkgver/frzr-autoupdate.service" "$pkgdir/etc/systemd/system"
  install -m 644 "$srcdir/frzr-$pkgver/frzr-autoupdate.timer" "$pkgdir/etc/systemd/system"

  install -dm755 "$pkgdir/etc"
  install -m644 -t "$pkgdir/etc" "$srcdir/frzr-$pkgver/etc"/*.conf
}
# Maintainer: HerauxValle <heraux.valle@gmail.com>
pkgname=casket
pkgver=1.0.2
pkgrel=1
pkgdesc="LUKS2 encrypted vault manager — each vault is a single .img file"
arch=('any')
url="https://github.com/HerauxValle/Casket"
license=('MIT')
depends=('python' 'cryptsetup' 'btrfs-progs' 'udisks2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/HerauxValle/Casket/archive/v$pkgver.tar.gz")
sha256sums=('39d02fa02999062adc7001dabb771d41a3adeb3d67082db68c518909ee004208')

package() {
    cd "$srcdir/Casket-$pkgver"
    install -Dm755 main.py "$pkgdir/usr/bin/cas"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 <(echo 'SUBSYSTEM=="block", KERNEL=="loop*", ENV{ID_FS_TYPE}=="crypto_LUKS", ENV{UDISKS_IGNORE}="1"') \
        "$pkgdir/usr/lib/udev/rules.d/99-cas-loop.rules"
}

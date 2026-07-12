pkgname=hpfand
pkgver=2.4.0
pkgrel=2
pkgdesc="Fan curve daemon for HP Victus/Omen laptops"
arch=('any')
url="https://github.com/emomaxd/hpfand"
license=('GPL-2.0-only')
depends=('bash' 'systemd')
keywords=('fan' 'fan-control' 'hp' 'victus' 'omen' 'hwmon' 'laptop')
optdepends=(
    'inotify-tools: automatic config reload on save'
    'hp-wmi-dkms: patched kernel module for pre-7.1 kernels'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/emomaxd/hpfand/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('72270d16af05d944d6b721d3a27f4a8983253df293e681402735ce3b89294f8e')

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 hpfand "$pkgdir/usr/bin/hpfand"
    install -Dm755 hpf    "$pkgdir/usr/bin/hpf"

    sed "s|HPFAND_BIN|/usr/bin/hpfand|" hpfand.service \
        | install -Dm644 /dev/stdin "$pkgdir/usr/lib/systemd/system/hpfand.service"
    install -Dm644 hpfand.sysusers "$pkgdir/usr/lib/sysusers.d/hpfand.conf"
}

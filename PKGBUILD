pkgname=hpfand
pkgver=2.2.1
pkgrel=1
pkgdesc="Fan curve daemon for HP Victus/Omen laptops"
arch=('any')
url="https://github.com/emomaxd/hpfand"
license=('GPL-2.0-only')
depends=('bash' 'systemd')
install=hpfand.install
keywords=('fan' 'fan-control' 'hp' 'victus' 'omen' 'hwmon' 'laptop')
optdepends=(
    'inotify-tools: automatic config reload on save'
    'hp-wmi-dkms: patched kernel module for pre-7.1 kernels'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/emomaxd/hpfand/archive/refs/tags/v$pkgver.tar.gz"
        "hpfand.install")
sha256sums=('74cc49aeb04a7e2eb2580c21fa6a5decacea48b2858ddc8f9a2644e705e4aa3b'
            '29e104ecfb8a490c34c605b96263d3e1b68e254ba3fd1647d1aa1bcc2cf3ece6')

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 hpfand "$pkgdir/usr/bin/hpfand"
    install -Dm755 hpf    "$pkgdir/usr/bin/hpf"

    sed "s|HPFAND_BIN|/usr/bin/hpfand|" hpfand.service \
        | install -Dm644 /dev/stdin "$pkgdir/usr/lib/systemd/system/hpfand.service"
}

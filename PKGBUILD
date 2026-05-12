pkgname=hpfand
pkgver=1.4.0
pkgrel=1
pkgdesc="Fan curve daemon for HP Victus/Omen laptops"
arch=('any')
url="https://github.com/emomaxd/hpfand"
license=('GPL-2.0-only')
depends=('bash' 'systemd')
optdepends=(
    'inotify-tools: automatic config reload on save'
    'hp-wmi-dkms: patched kernel module for pre-7.1 kernels'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/emomaxd/hpfand/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('591994cb57f792a547f7e21ef9d204cabd800147cfad39ff7212098bf00d76e4')

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 hpfand "$pkgdir/usr/bin/hpfand"
    install -Dm755 hpf    "$pkgdir/usr/bin/hpf"

    sed "s|HPFAND_BIN|/usr/bin/hpfand|" hpfand.service \
        | install -Dm644 /dev/stdin "$pkgdir/usr/lib/systemd/system/hpfand.service"
}

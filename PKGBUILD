# Maintainer: Nils Werner <nils.werner@gmail.com>

pkgname=crestic
pkgver=0.4.0
pkgrel=1
pkgdesc="Configurable restic wrapper"
arch=('any')
url="https://github.com/nils-werner/$pkgname"
license=('MIT')
depends=('python' 'restic')
optdepends=(
    'python-appdirs: support for loading config files using appdirs'
)
source=(
    "https://github.com/nils-werner/$pkgname/archive/v$pkgver.tar.gz"
    "crestic@.service"
    "crestic@.timer"
)
sha256sums=(
    "93b5df2a3caf4a1e7f63b164f01f366d26118874b3c75fe1a4222206e4fcb47e"
    "59e47195ddcddf825cd3a85b2c1b10a2557ba60708adc96c4175b3a8f63fff1c"
    "3d85d601b61a520cc72936d1314ee3dc1825dd1ed5f669e166099809c91ee0c2"
)

package() {
    install -Dm 0644 crestic@.service -t "$pkgdir"/usr/lib/systemd/system/
    install -Dm 0644 crestic@.timer -t "$pkgdir"/usr/lib/systemd/system/
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm 0755 "$pkgname".py "$pkgdir"/usr/bin/"$pkgname"
    install -Dm 0644 LICENSE -t "$pkgdir"/usr/share/licenses/"$pkgname"/
}

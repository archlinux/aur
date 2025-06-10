# Maintainer: Nils Werner <nils.werner@gmail.com>

pkgname=crestic
pkgver=1.1.0
pkgrel=1
pkgdesc="Configurable restic wrapper"
arch=('any')
url="https://github.com/nils-werner/$pkgname"
license=('MIT')
depends=('python' 'restic')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=(
    "https://github.com/nils-werner/$pkgname/archive/v$pkgver.tar.gz"
    "crestic-backup@.service"
    "crestic-backup@.timer"
    "crestic-forget@.service"
    "crestic-forget@.timer"
)
sha256sums=(
    "02969343c517ac5954724491e2f721e0ee4ac287cc7dbf0a307816bb9ec67aa8"
    "487bdee984708f7c8e3fdf300d372a9cf60ac212c3898231011d50b4bb2161e6"
    "be3b2461029a2d92329bcc1b42a8207f1c75ce03a6df86d72788ff2b8772ba70"
    "d8a94324994b2caae186f70f1463bee7b998547e31739c6e790f9fca37019022"
    "ea0050225c6527f8ebcc146f6dd60e15dede64b5820e25d94e511f7c01594ffc"
)

build () {
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    install -Dm 0644 crestic-backup@.service -t "$pkgdir"/usr/lib/systemd/system/
    install -Dm 0644 crestic-backup@.timer -t "$pkgdir"/usr/lib/systemd/system/
    install -Dm 0644 crestic-backup@.service -t "$pkgdir"/usr/lib/systemd/user/
    install -Dm 0644 crestic-backup@.timer -t "$pkgdir"/usr/lib/systemd/user/
    install -Dm 0644 crestic-forget@.service -t "$pkgdir"/usr/lib/systemd/system/
    install -Dm 0644 crestic-forget@.timer -t "$pkgdir"/usr/lib/systemd/system/
    install -Dm 0644 crestic-forget@.service -t "$pkgdir"/usr/lib/systemd/user/
    install -Dm 0644 crestic-forget@.timer -t "$pkgdir"/usr/lib/systemd/user/
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm 0644 LICENSE -t "$pkgdir"/usr/share/licenses/"$pkgname"/
    python -m installer --destdir="$pkgdir" dist/*.whl
}

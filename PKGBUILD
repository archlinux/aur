# Maintainer: Nils Werner <nils.werner@gmail.com>

pkgname=crestic
pkgver=0.4.1
pkgrel=2
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
    "3bb0bf1c80c774a3b3ba85d018600f61b425510d230353b1d819a20b902c009b"
    "48755b767dfcad51dd48a9628e5d7f34133dfa40445488470cf78c203ae714e3"
    "f9940ec04c29d1373496437758c807f8cb5bc272fa16b0ba6351c7d0ec8cd691"
)

package() {
    install -Dm 0644 crestic@.service -t "$pkgdir"/usr/lib/systemd/system/
    install -Dm 0644 crestic@.timer -t "$pkgdir"/usr/lib/systemd/system/
    mkdir -p "$pkgdir"/usr/lib/systemd/user/
    ln -s ../system/crestic@.service "$pkgdir"/usr/lib/systemd/user/
    ln -s ../system/crestic@.timer "$pkgdir"/usr/lib/systemd/user/
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm 0755 "$pkgname".py "$pkgdir"/usr/bin/"$pkgname"
    install -Dm 0644 LICENSE -t "$pkgdir"/usr/share/licenses/"$pkgname"/
}

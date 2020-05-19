# Maintainer: Nils Werner <nils.werner@gmail.com>

pkgname=crestic
pkgver=0.4.1
pkgrel=4
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
    "487bdee984708f7c8e3fdf300d372a9cf60ac212c3898231011d50b4bb2161e6"
    "d1a2ab70e79257d39f8ce623fdb1f72243072671a83a0ad4959f7bff8ea9b335"
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

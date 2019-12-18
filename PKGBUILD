# Maintainer: Alex Agura <agura@tfwno.gf>
pkgname=asus-fan-control
pkgver=2.10.0
pkgrel=1
pkgdesc="ACPI fan control for ASUS devices running Linux."
arch=('any')
url="https://github.com/dominiksalvet/asus-fan-control"
license=('MIT')
depends=(acpi_call dmidecode)
makedepends=()
optdepends=()
backup=('etc/asus-fan-control/custom-temps')
install=$pkgname.install
source=("https://github.com/dominiksalvet/$pkgname/archive/$pkgver.tar.gz"
        "$pkgname.service")
md5sums=('29ba664e97e2b2e4cb6eda6e476a2247'
         '2e119644e62cb2e0059af3f16afa7013')

package() {
    cd "$pkgname-$pkgver"

    for dir in usr/{bin,lib/systemd/system,share/{bash-completion/completions,asus-fan-control}} /etc/asus-fan-control; do
        mkdir -p $pkgdir/$dir
    done

    install -m644 data/default-temps              $pkgdir/usr/share/asus-fan-control
    install -m755 src/asus-fan-control            $pkgdir/usr/bin
    install -m644 src/asus-fan-control-completion $pkgdir/usr/share/bash-completion/completions/asus-fan-control
    install -m644 ../$pkgname.service             $pkgdir/usr/lib/systemd/system
    # Create a dummy config, so it can be properly tracked by pacman
    touch $pkgdir/etc/asus-fan-control/custom-temps
}

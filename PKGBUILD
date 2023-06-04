pkgname=kernel-install-mkinitcpio
_gitname=eos-systemd-boot
pkgver=1.3
pkgrel=3
pkgdesc='A framework for enabling systemd-boot automation using kernel-install with mkinitcpio'
arch=(any)
url='https://gitlab.com/dalto.8/eos-systemd-boot'
license=(GPL2)
depends=(systemd mkinitcpio)
conflicts=(dracut kernel-install-for-dracut)
source=("$_gitname-$pkgver.tar.gz::$url/-/archive/$pkgver/$_gitname-$pkgver.tar.gz"
        "50-mkinitcpio.install")
sha512sums=('80d55d3f176f83e4a08b97106c4e3c7f98763bf16ef867142472cba165817c36322c82588ad288e4d47fa5729f48149e53640530481c170f13abf859d402dfce'
            '780ee5922fa20d20031ab71c9c324ad1f4e89fa8748600c33201f62660851e64d14b58cd1e2434e2241197e5b82fc3a90fc5794fbb238ba77db486ec4abbcb13')

package()
{
    # install the package files
    cp -a "${srcdir}"/$_gitname-$pkgver/src/{usr,etc} "${pkgdir}"

    # mask the default loaderentry creator
    mkdir -p "${pkgdir}/etc/kernel/install.d"
    touch "${pkgdir}/etc/kernel/install.d/90-loaderentry.install"

    # temporarily override 50-mkinitpcio.install until it is fixed
    mkdir -p "${pkgdir}/etc/kernel/install.d"
    install -Dm755 "${srcdir}/50-mkinitcpio.install" "${pkgdir}/etc/kernel/install.d/50-mkinitcpio.install"
}

# Maintainer: HeCodes2Much <HeCodes2Much@github.com>
# Contributor: HeCodes2Much <HeCodes2Much@github.com>
# shellcheck disable=all

pkgname=pacmanity
pkgver=2021.11.14
pkgrel=1
pkgdesc="Keeps a list of installed packages in a Gist at your GitHub account"
arch=('x86_64')
url="https://github.com/HeCodes2Much/$pkgname"
license=('GPL')
makedepends=('git')
depends=('pacman>=6.0' 'gist>=4.5.0')
source=("${pkgname}-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
sha256sums=('64c874b208126a0cf6e28b81b15912dae87010cd48b01c09b20564cd1646e1c5')
install=${pkgname}.install

package() {
    cd "$pkgname-$pkgver"
    # Install script
    mkdir -p $pkgdir/usr/lib/pacmanity
    install -Dm755 pacmanity_update $pkgdir/usr/lib/pacmanity/pacmanity_update
    chmod +x $pkgdir/usr/lib/pacmanity/pacmanity_update

    install -Dm755 pacmanity_install $pkgdir/usr/bin/pacmanity_install
    chmod +x $pkgdir/usr/bin/pacmanity_install

    # Install Hook
    mkdir -p $pkgdir/usr/share/libalpm/hooks
    install -Dm755 pacmanity.hook $pkgdir/usr/share/libalpm/hooks/99-pacmanity.hook

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}

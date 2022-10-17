# Maintainer: Catemiko
# Contributor: BeardOverflow

_gitname=msi-ec
pkgname=$_gitname-git
pkgver=1
pkgrel=1
pkgdesc="Driver for MSI laptop EC"
arch=('any')
url="https://github.com/BeardOverflow/msi-ec"
license=('GPL2')
depends=()
makedepends=('git')
backup=()
conflicts=()
provides=('msi-ec')

source=("git+https://github.com/BeardOverflow/msi-ec.git")
sha256sums=('SKIP')

build() {
    cd "${_gitname}"
    make
}

package() {
    cd "${_gitname}"
    echo msi-ec > msi-ec.conf

    install -Dm 644 msi-ec.conf "${pkgdir}/etc/modules-load.d/msi-ec.conf"
    install -Dm 644 msi-ec.ko "${pkgdir}/usr/lib/modules/$(uname -r)/extra/msi-ec.ko"
}

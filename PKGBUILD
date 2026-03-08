# Maintainer: Filip Parag <filip@parag.rs>

pkgname=bas-celik-bin
pkgver=2.5.0
pkgrel=1
pkgdesc='A program for reading smart-card documents issued by the government of Serbia'
arch=(x86_64)
conflicts=(bas-celik)
provides=()
url="https://github.com/ubavic/bas-celik/"
license=(MIT)
depends=(ccid opensc)
source=("bas_celik-${pkgver}_amd64.tar.xz::https://github.com/ubavic/bas-celik/releases/download/v${pkgver}/bas-celik.linux.amd64.tar.xz")
sha256sums=('5f08fc1ad98e5f59a9d21264cf571fa8bcd2a46df00366269b671a58a16f7231')

package()
{
    export DESTDIR="${pkgdir}"
    export PREFIX="/usr"
    cd "${srcdir}"
    make install
}

test_pcscd()
{
    if ! systemctl is-active --quiet pcscd.service; then
        echo 'This program requires pcscd service to be running'
    fi
}

post_install()
{
    test_pcscd
}

post_upgrade()
{
    test_pcscd
}

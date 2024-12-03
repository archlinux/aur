# Maintainer: Filip Parag <filip@parag.rs>

pkgname=bas-celik-bin
pkgver=2.0.0
pkgrel=1
pkgdesc='A program for reading smart-card documents issued by the government of Serbia'
arch=(x86_64)
conflicts=(bas-celik)
provides=()
url="https://github.com/ubavic/bas-celik/"
license=(MIT)
depends=(ccid opensc)
source=("bas_celik-${pkgver}_amd64.tar.gz::https://github.com/ubavic/bas-celik/releases/download/v${pkgver}/bas-celik.linux.amd64.tar.xz")
sha256sums=('c3c33b9954ada5e8a722343b889c97acbbdf9c8e9bf3ccd966e27d8b10699117')

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

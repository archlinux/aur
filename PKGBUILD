# Maintainer: Filip Parag <filip@parag.rs>

pkgname=bas-celik-cli-bin
pkgver=2.0.0
pkgrel=1
pkgdesc='Command line program for reading smart-card documents issued by the government of Serbia'
arch=(x86_64)
conflicts=(bas-celik)
provides=()
url='https://github.com/ubavic/bas-celik/'
license=(MIT)
depends=(ccid opensc)
source=("bas_celik_cli-${pkgver}_amd64::https://github.com/ubavic/bas-celik/releases/download/v${pkgver}/bas-celik-cli.linux.amd64")
sha256sums=('7526e9394b60954d43fc1b407cf561e17166c9d95d3cf79738f821fb4be004ab')

package()
{
    cd "${srcdir}"
    install -Dm 755 "bas_celik_cli-${pkgver}_amd64" "${pkgdir}/usr/bin/bas-celik-cli"
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

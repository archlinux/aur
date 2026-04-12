# Maintainer: Filip Parag <filip@parag.rs>

pkgname=bas-celik-cli-bin
pkgver=2.6.0
pkgrel=1
pkgdesc='Command line program for reading smart-card documents issued by the government of Serbia'
arch=(x86_64)
conflicts=(bas-celik)
provides=()
url='https://github.com/ubavic/bas-celik/'
license=(MIT)
depends=(ccid opensc)
source=("bas_celik_cli-${pkgver}_amd64::https://github.com/ubavic/bas-celik/releases/download/v${pkgver}/cli-bas-celik.linux.amd64")
sha256sums=('29b9f7b7c72db17d8b3fe15b8acf6ad8889c2d459f1c132af6f9ba0d6da13233')

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

# Maintainer: Matej Lach <me@matej-lach.me>

pkgname=roon-cli
pkgver=2.0.8r5
pkgrel=5
pkgdesc='Command line control of the Roon audio system over a local network'
arch=(any)
url='https://gitlab.com/doctorfree/RoonCommandLine'
license=('APACHE')
depends=('python-roonapi')
source=("https://gitlab.com/doctorfree/RoonCommandLine/-/archive/v${pkgver}/RoonCommandLine-v${pkgver}.tar.gz"
        'roon')
sha512sums=('7d91311f8be66415c1af4a31d64aed218500403b9272e1b5feafd59b51560a5d670cb4706069b3642aeead7fecf31eaa21e12db0b9124bf3488ec433b0f6e99d'
            'b158754f3cbba37413e44bb5de54f5480e8e698b52699221963af8310db5e5ddf1fc0cf4360426d315aa4bb4f68458a10158c8410f4d8f911cdb40e12a2f935c')
install=${pkgname}.install

prepare() {
    mv "${srcdir}/RoonCommandLine-v${pkgver}/etc/roon_api.ini-dist" "${srcdir}/RoonCommandLine-v${pkgver}/etc/roon_api.ini"
}

package() {
    install -d "${pkgdir}/usr/local/Roon"
    install -d "${pkgdir}/usr/bin"

    install -d "${pkgdir}/usr/share/man/man1"
    install -d "${pkgdir}/usr/share/man/man5"

    cp -r "RoonCommandLine-v${pkgver}/api" "${pkgdir}/usr/local/Roon/"
    cp -r "RoonCommandLine-v${pkgver}/bin" "${pkgdir}/usr/local/Roon/"
    cp -r "RoonCommandLine-v${pkgver}/etc" "${pkgdir}/usr/local/Roon/"
    cp -r "RoonCommandLine-v${pkgver}/patches" "${pkgdir}/usr/local/Roon/"

    cp RoonCommandLine-v${pkgver}/man/man1/* "${pkgdir}/usr/share/man/man1/"
    cp RoonCommandLine-v${pkgver}/man/man5/* "${pkgdir}/usr/share/man/man5/"

    install -m 755 roon "${pkgdir}/usr/bin/"
    install -Dm0644 -t "${pkgdir}/usr/share/licenses/$pkgname/" "RoonCommandLine-v${pkgver}/LICENSE"

    chown -R $USER ${pkgdir}/usr/local/Roon/
    chmod +x ${pkgdir}/usr/bin/roon
}

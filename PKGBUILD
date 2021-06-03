# Maintainer: Alley_Cat <read_only@gmx.us>
#
# Contributor: Alley_Cat <read_only@gmx.us>
#
pkgname="seahorse-caja"
pkgver="1.18.5"
pkgrel="1"
pkgdesc="An extension for caja which allows encryption and decryption of OpenPGP files using GnuPG."
url="https://github.com/darkshram/seahorse-caja/"
license=('GPL2')
arch=('i686' 'x86_64')
depends=('caja' 'dbus-glib' 'gcr' 'gnupg' 'gpgme' 'gtk3' 'intltool' 'libcryptui' 'libnotify')
provides=("${pkgname}")
source=("https://github.com/darkshram/"${pkgname}/releases/download/${pkgver}/"${pkgname}-${pkgver}.tar.xz")
sha512sums=('85b022439faeadc20202111adf0056993e560a3e1d0c06b9788f5f871fdd452c52b198da3510ad444f7be8e917783e1d016cc240b220cdd85391140b79adb2f1')

build() {
    cd "${pkgname}-${pkgver}"
    NOCONFIGURE=1 ./autogen.sh
    ./configure --prefix /usr
    make
}
package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR=${pkgdir} install
    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=4 sw=2 ft=sh et:

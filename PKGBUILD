# Maintainer: Lev Lybin <lev.lybin@gmail.com>

pkgname=upwork
pkgver=4.0.109.0
_rawver=${pkgver//./_}
_hashver="5dd4be27f24afbda38b590"
pkgrel=3
pkgdesc="Team App (ex. oDesk)"
arch=('i686' 'x86_64')
url="https://www.upwork.com/downloads/new-team-application"
license=('unknown')
conflicts=('upwork-beta' 'upwork-alpha')
depends=('gtk2' 'nss' 'nss-upwork' 'gconf' 'alsa-lib' 'glu' 'libxtst' 'gtkglext' 'libgcrypt15' 'libxss')
install=upwork.install

# how to get links Standart, Beta, Alpha: grep updates.getVersionToDownload ~/.Upwork/Upwork/Logs/* | tail -n 1 | grep -o 'http://[a-zA-Z/.0-9_]*.deb'
source_x86_64=(upwork_amd64_${pkgver}.deb::http://updates.team.odesk.com/binaries/v${_rawver}_${_hashver}/upwork_amd64.deb)
source_i686=(upwork_i386_${pkgver}.deb::http://updates.team.odesk.com/binaries/v${_rawver}_${_hashver}/upwork_i386.deb)
md5sums_x86_64=('c0379775740ede61e431b94e22cdddbe')
md5sums_i686=('2deb4a87f09b67e20e9ae1726572b46b')

prepare() {
    cd "${srcdir}"
    tar -zxf "${srcdir}/data.tar.gz"
}

package() {
    cd "${srcdir}"
    cp -rp usr "${pkgdir}/usr"

    #ln -s /usr/lib/libssl.so "${pkgdir}/usr/share/upwork/libssl.so.6"
    ln -s /usr/lib/libcrypto.so "${pkgdir}/usr/share/upwork/libcrypto.so.6"
    ln -s /usr/lib/libudev.so "${pkgdir}/usr/share/upwork/libudev.so.0"

    ln -s /usr/lib/libnss3-upwork.so "${pkgdir}/usr/share/upwork/libnss3.so"
    ln -s /usr/lib/libsoftokn3-upwork.so "${pkgdir}/usr/share/upwork/libsoftokn3.so"
    ln -s /usr/lib/libssl3-upwork.so "${pkgdir}/usr/share/upwork/libssl.so.6"
}
# Maintainer: Dustin Widmann <thedustinwidmann [at] (gmail)>
pkgname=('rs-visa')
_pkgbase=('rs-visa')
provides=('rs-visa')
pkgver=5.12.9
pkgrel=1
pkgdesc="Rohde & Schwarz VISA library for Linux."
url="https://www.rohde-schwarz.com/us/driver-pages/remote-control/3-visa-and-tools_231388.html"
arch=('x86_64')
license=('ROHDE & SCHWARZ Royalty Free License')
depends=('glibc' 'libusb' 'avahi' 'gcc-libs' 'systemd-libs' 'dbus' 'libcap' 'libgcrypt' 'xz' 'zstd' 'lz4' 'libgpg-error')
optdepends=('python-pyvisa: python 3 frontend'
            'qt5-base: for R&S GUI frontend tools')
source=("https://scdn.rohde-schwarz.com/ur/pws/dl_downloads/dl_application/application_notes/1dc02___rs_v/rsvisa_${pkgver}_amd64.deb")
md5sums=('ea91df958959fdfe5fd485d720f574e8')
install='INSTALL'

prepare() {
    ar x ${srcdir}/rsvisa_${pkgver}_amd64.deb
    tar xf ${srcdir}/data.tar.gz
    cd "${srcdir}"
}

package() {
    mkdir -p "${pkgdir}"/usr/{include/rsvisa,lib,bin};
    mkdir -p "${pkgdir}"/usr/share/{applications,cmake/RsVisa,doc/rsvisa/Samples/IdnSample,pixmaps};
    mkdir -p "${pkgdir}"/usr/share/licenses/$pkgname/;
    
    cp -r ${srcdir}/etc/* ${pkgdir}/etc/;
    cp -r ${srcdir}/usr/* ${pkgdir}/usr/;
    install -Dm644 ${srcdir}/../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE";
}

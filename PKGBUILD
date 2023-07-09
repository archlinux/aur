# Maintainer: Kyle Manna <kyle(at)kylemanna(dot)com>
# Co-Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>

pkgname=expressvpn
pkgver=3.49.0.28_1
pkgrel=1
pkgdesc="Proprietary VPN client for Linux"
arch=('x86_64' 'i686' 'armv7h')
url="https://expressvpn.com"
license=('custom')
options=(!strip)
install=expressvpn.install
_url="https://www.expressvpn.works/clients/linux"
source_x86_64=("${_url}/${pkgname}_${pkgver/_/-}_amd64.deb"{,.asc})
source_i686=("${_url}/${pkgname}_${pkgver/_/-}_i386.deb"{,.asc})
source_armv7h=("${_url}/${pkgname}_${pkgver/_/-}_armhf.deb"{,.asc})

sha512sums_x86_64=('2923291ddf608e7ae5905b2aa75996c0a7d6713a848ff013d384d0b4aaf0616732e7fdd40412c513b7ee5ae3146392e0c66303030dccccc1b7670cd19f4ed3ce'
                   'SKIP')
sha512sums_i686=('e5e6dc65971195931bb2c357a6fc3c03a68e17289136baff25164beb6daf116968c2c84ee0f7669acba02a3d634701048b1d789d7ba81424c1bcd8c620a90a26'
                 'SKIP')
sha512sums_armv7h=('0fba0d8aabf05f8a205ad41259f34b8a018fc6b677fe311e4495696470e20578b5409957259fcb496313cfe1e4bf0efd10a51556819a99b62072faae1612632d'
                   'SKIP')
validpgpkeys=('1D0B09AD6C93FEE93FDDBD9DAFF2A1415F6A3A38')

package() {
    # /usr/sbin is a symlink to /usr/bin, rewrite it. Upstream also install files to both /lib and /usr/lib
    # merge these and move to correct location
    bsdtar -C "${pkgdir}" -xf "${srcdir}/data.tar.gz" -s ":/usr/sbin:/usr/bin:" -s ":/usr/lib:/lib:"
    mv "${pkgdir}/lib" "${pkgdir}/usr/"

    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s "/usr/share/doc/expressvpn/COPYRIGHT" "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"

    install -dm755 "${pkgdir}/var/lib/expressvpn/certs"

    # Remove unused /etc
    rm -r "$pkgdir/etc/"
}

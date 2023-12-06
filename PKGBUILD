# Maintainer: Kyle Manna <kyle(at)kylemanna(dot)com>
# Co-Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>

pkgname=expressvpn
pkgver=3.60.0.4_1
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

sha512sums_x86_64=('658bc813a9d27ee7cb101e9c9721e4da42a9ea9d048ed6e92f7430d97f1acd1c9111bd96d2892d74713787ba8a674db1c1706cd42fc3607651d4a68df07660ee'
                   'SKIP')
sha512sums_i686=('9b6bc7ebe51f3323dd10a62548e819861a2e51376cab7132efecfb21d1ee325c899724e8e6f0fc6fba948903d1e2988249e9189e15cffcb8395fa160a2068b48'
                 'SKIP')
sha512sums_armv7h=('e44c8badb360d2012edefc851f13bedc7607445e234ab49c9257c3c82820b3078080ed4518829c8ec2c1e86f95550a3be56fb41e0cbc59e75619fb8f62ab7073'
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

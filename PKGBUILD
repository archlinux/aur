# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=duetwebserver-bin
pkgver=1.2.3.1
pkgrel=1
pkgdesc="Optional web server for Duet 3 series"
arch=('armv7h' 'aarch64')
url="https://github.com/chrishamm/DuetSoftwareFramework.git"
license=('GPL3')
provides=("duetwebserver=${pkgver}")
conflicts=("duetwebserver")
depends=('duetcontrolserver>=1.2.0.0' 'duetruntime>=1.2.0.0')
optdepends=('duetwebcontrol' 'duetsd')
options=(!strip staticlibs)
backup=('opt/dsf/conf/http.json')
source_armv7h=("https://pkg.duet3d.com/dists/stable/armv7/binary-armhf/duetwebserver_${pkgver}_armhf.deb")
source_aarch64=("https://pkg.duet3d.com/dists/stable/armv7/binary-arm64/duetwebserver_${pkgver}_arm64.deb")
md5sums_armv7h=('d14fce7634a003a4a4b1139c223bf4a8')
md5sums_aarch64=('373e9326247aa1c37a3c3240ea9eafae')
sha1sums_armv7h=('73bd14864d011a2969e5496d2340cbcb872225c3')
sha1sums_aarch64=('a04bb26034bf38b6fbe11214e57ea2f7ed1ec5bd')
sha256sums_armv7h=('6c791293e17c3280ec5063a5050bdeda95cdc1ede937d572718a9b630afe29c6')
sha256sums_aarch64=('bab25f79325cb17431bb66741343b86db68a6d48af7b7bf88b62b2260dc48b82')
sha512sums_armv7h=('5a0ca6824c7df0e9c2d473b52e665e8dbbd35380193a3ec5bb1d1213a876d045585e7b437610e114a09cc55734f1d3a82f47d7b7f55f755e1f395b8e04b785fe')
sha512sums_aarch64=('f2422d43a482fc685f59d37504ef75eb21cf8ebea3557a91594678885ab320bba4e0c9ea6b5bfac3567ff6660e38f1c7f90ee65fc142d154752b4d6e50991897')

prepare() {
    tar -xf data.tar.xz
}

package() {
	install -dm 755 "${pkgdir}"/{opt/dsf/bin,opt/dsf/conf,usr/bin,usr/lib/systemd/system}
	install "${srcdir}/opt/dsf/bin/"* "${pkgdir}/opt/dsf/bin"
	ln -s "/opt/dsf/bin/DuetWebServer" "${pkgdir}/usr/bin/"
	install -m 644 "${srcdir}/usr/lib/systemd/system/"* "${pkgdir}/usr/lib/systemd/system"
	install -m 644 "${srcdir}/opt/dsf/conf/"* "${pkgdir}/opt/dsf/conf"
}

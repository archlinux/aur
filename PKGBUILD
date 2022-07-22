# This is an example of a PKGBUILD for splitting packages. Use this as a
# start to creating your own, and remove these comments. For more information,
# see 'man PKGBUILD'. NOTE: Please fill out the license field for your package!
# If it is unknown, then please put 'unknown'.

# Maintainer: Terra Brown <superloach42@gmail.com>
pkgname=('linux-galliumos-bin' 'linux-galliumos-headers-bin')
pkgver=4.16.18
pkgrel=1
pkgdesc="GalliumOS kernel for most Chromebooks and Chromeboxes, version: ${pkgver}"
arch=(x86_64)
url="https://github.com/GalliumOS/linux"
license=('GPL2')
source=("https://apt.galliumos.org/pool/main/l/linux-4.16.18-galliumos/linux-image-4.16.18-galliumos_4.16.18-galliumos4_amd64.deb"
        "https://apt.galliumos.org/pool/main/l/linux-4.16.18-galliumos/linux-headers-4.16.18-galliumos_4.16.18-galliumos4_amd64.deb")
noextract=("$(basename ${source[0]})"
           "$(basename ${source[1]})")
sha256sums=('4be88294cdc5a39e1adfa7003c8a0f99a7372a4ca3e343711266fe2033f59be8'
            '6c14f8c5e998b960a87ee990ed4f08178c7614a2db63e98f98da8159f4f8abed')

package_linux-galliumos-bin() {
	cd "$srcdir"
	bsdtar -xf ${srcdir}/${noextract[0]} -C ${srcdir} data.tar.xz
	bsdtar -xf ${srcdir}/data.tar.xz -C ${pkgdir}/
	chown root:root -vR "${pkgdir}/"
}

package_linux-galliumos-headers-bin() {
	cd "$srcdir"
	bsdtar -xf ${srcdir}/${noextract[1]} -C ${srcdir} data.tar.xz
	bsdtar -xf ${srcdir}/data.tar.xz -C ${pkgdir}/
	chown root:root -vR "${pkgdir}/"
}


pkgname=doublecmd-plugin-p7z-usr
_pkgname=p7z-usr
pkgver=0.9
pkgrel=1
pkgdesc='Plugin for Double Commander that provides 7-Zip file archiver features'
arch=(x86_64)
url='https://github.com/ikk00/p7z-usr'
license=('GPL3')
depends=('doublecmd' 'p7zip')
source=(https://github.com/ikk00/p7z-usr/archive/v0.9.tar.gz
        https://downloads.sourceforge.net/project/p7zip/p7zip/15.09/p7zip_15.09_src_all.tar.bz2)
noextract=('p7zip_15.09_src_all.tar.bz2')
sha512sums=('a392d1aa44601a1e63ec4761704ca59cbe234dc4e6d893514f1032f7d2ef2cd15f54ebcef3db6e61ec9bcaa8dfaf26391fab134f9adfcf85a7a2f6d177d8f00f'
            '4f020b13632ef7a85aa8a98586b59bef2dde3c1cbebdbd17e01f1d09b2e13a56ecfe82546d7efc677c45df67456a71cfdb67826b53ebea4c0fb4878f20c2f6dd')

prepare() {
	cd "${_pkgname}-${pkgver}"

	bsdtar -xf p7z_usr_0x9_source.zip
	bsdtar -xf "${srcdir}/p7zip_15.09_src_all.tar.bz2" --strip-components 1 -C p7zip/compatible_version p7zip_15.09/C p7zip_15.09/CPP
}
build() {
	cd "${_pkgname}-${pkgver}/projects/01_shared_lib"

	make release
}

package() {
	cd "${_pkgname}-${pkgver}/projects/01_shared_lib"

        install -d "${pkgdir}/usr/lib/doublecmd/plugins/wcx/p7z_usr"
        
        cp bin/release/p7z_usr.wcx "${pkgdir}/usr/lib/doublecmd/plugins/wcx/p7z_usr"
        cp p7z_usr.ini "${pkgdir}/usr/lib/doublecmd/plugins/wcx/p7z_usr"
        ln -s "/usr/lib/p7zip/7z.so" "${pkgdir}/usr/lib/doublecmd/plugins/wcx/p7z_usr"
}

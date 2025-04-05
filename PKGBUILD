# Maintainer: GouGou <xingru97@gmail.com>
pkgname=netease-popo
pkgver=3.71.1.13000
pkgrel=2
pkgdesc="Netease POPO for linux"
arch=('x86_64')
url="https://www.netease.com"
license=('LicenseRef-popo')
depends=('twolame' 'numactl')
options=('!strip' '!emptydirs')
source_x86_64=("https://popo.gdl.netease.com/file/popolinux/POPO-setup_prod_1691735489662.deb")
source=("${pkgname}.sh")
sha512sums=('293c5e8635df28104a43c7a1a4129c98e263d5c2ce845321d7b5f4cb0da91cd65f3e22d63369169a56ef645044056dcbbad0e5ddd0da512f048d21665c92dcdc')
sha512sums_x86_64=('77cf0da179be048185a1d67d7ac2954139cf2ab692f72c7b0161f26e182ce24e74019dcc39218767349cf653220c1958ee20ce0431308b67e6967eed6b24bd11')
package() {
	echo ":: Extracting data.tar.xz..."
	tar -xf data.tar.xz -C "${pkgdir}"
	echo ":: Install license file..."
	install -D -m644 "${pkgdir}/usr/share/doc/popo/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	echo ":: Creating Launcher..."
	install -D -m644 "${pkgdir}/opt/apps/popo/entries/applications/popo.desktop" "${pkgdir}/usr/share/applications/popo.desktop"
	echo ":: Install Launcher file..."
	install -D -m755 "${pkgname}.sh" "${pkgdir}/opt/apps/popo/files/netease-popo.sh"
	sed -i "s/Elevator\.sh/netease-popo\.sh/g" ${pkgdir}/usr/share/applications/popo.desktop
	echo ":: Fixing conflicting package-bundled libstdc++..."
	# Temporary Solution: There is a bundled libc .so file in package conflicting with system's one. Remove it.
	rm -vf ${pkgdir}/opt/apps/popo/files/3.71.1.13000/libstdc++*
}

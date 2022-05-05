# Maintainer: Ariejan de Vroom <ariejan[at]devroom[dot]io>
pkgname=txdx-bin
_pkgname=txdx
pkgver=1.1.3
pkgrel=1
pkgdesc="Todo's like you've never seen before"
arch=('x86_64')
url='https://www.txdx.eu'
license=('GPL2')
provides=("$_pkgname")
conflicts=("$_pkgname")
depends=('gtk3' 'zenity')

source=("https://gitlab.devroom.io/api/v4/projects/17/packages/generic/txdx/1.1.3/txdx-1.1.3-linux-x64.tar.gz")
sha256sums=('e8499189c07b292ac1ee0ad68852a34498ee66679a5a60e1d6338f9bf620189e')

package() {
	install -dm755 ${pkgdir}/opt/${_pkgname}/
	mv ${_pkgname} ${pkgdir}/opt/${_pkgname}/
	mv data ${pkgdir}/opt/${_pkgname}/
	mv lib ${pkgdir}/opt/${_pkgname}/
	
	install -dm755 ${pkgdir}/usr/bin
	ln -s /opt/${_pkgname}/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}

	install -Dm 644 ${pkgdir}/opt/${_pkgname}/data/flutter_assets/assets/txdx.png ${pkgdir}/usr/share/pixmaps/txdx.png

	install -dm 755 "${pkgdir}/usr/share/applications"
	cat > ${pkgdir}/usr/share/applications/${_pkgname}.desktop << EOF
[Desktop Entry]
Name=TxDx
Comment=Todo.txt for your desktop
Exec=${_pkgname}
Version=${pkgver}
Type=Application
Icon=${_pkgname}
Terminal=false
StartupNotify=false
Categories=Productivity;Utilities;
EOF
}

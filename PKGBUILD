# Maintainer: sukanka
pkgname=xuanxuan
pkgver=6.2
pkgrel=1
pkgdesc="一款面向企业协同的及时通讯软件！"
arch=('any')
url="https://xuan.im"
license=('custom')
depends=('electron13')
source=("${pkgname}-${pkgver}.deb::https://www.xuanim.com/dl/xuanxuan/${pkgver}/xuanxuan.${pkgver}.linux.amd64.deb"
"$pkgname".sh
)
sha512sums=('80fcac23f714c99710ee4c5829c86add82c2415fdfcad7310771a213406d103e9b276ab3f2bd007e9ffb458e79bd9438f78d6c70f68dd6dfdb722525cc7cade8'
            'b5f6c579c447bb9708183064fc46f728a093e1a0446136f76cdaf593bd73830b00e6e20676f9ab3cfa6cd4d13935a2f9624059521e6dce3b145675678eda080a')

prepare(){
	cd $srcdir
	tar -xvf data.tar.xz -C "${srcdir}"
	cp -rf  opt/${pkgname}/resources ${srcdir}/usr/share/${pkgname}
	sed -i "s|^Exec.*|Exec=xuanxuan %U|g" usr/share/applications/${pkgname}.desktop
}

package(){
	cd $srcdir
	cp -rf usr ${pkgdir}
	rm -rf ${pkgdir}/usr/share/${pkgname}/bin
	install -Dm755 ${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}

}

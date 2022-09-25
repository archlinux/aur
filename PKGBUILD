# Contributor: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: sukanka
pkgname=xuanxuan
pkgver=6.4
pkgrel=1
pkgdesc="一款面向企业协同的及时通讯软件！"
arch=('any')
url="https://xuan.im"
license=('custom')
depends=('electron13')
source=("${pkgname}-${pkgver}.deb::https://www.xuanim.com/dl/xuanxuan/${pkgver}/xuanxuan.${pkgver}.linux.amd64.deb"
"$pkgname".sh
)
sha512sums=('d72ca952b0541b7e5e26fd0bf782d9ba872bf849ff31dc407ece5fea98b62fb6853122fee285b76f239226ee23477d06fdac8bc9c7995f2635a573e28c7d20dd'
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

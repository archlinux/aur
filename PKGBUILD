# Maintainer: sukanka
pkgname=xuanxuan
pkgver=5.6
pkgrel=1
pkgdesc="一款面向企业协同的及时通讯软件！"
arch=('any')
url="https://xuan.im"
license=('custom')
dependes=('electron13')
source=("${pkgname}-${pkgver}.deb::https://www.xuanim.com/dl/xuanxuan/${pkgver}/xuanxuan.${pkgver}.linux.amd64.deb"
"$pkgname".sh
)
sha512sums=('bb302f97f7f36cc3608591ad2e14e006c1aa246f6b0c54cf803512d2cca847076bbdd7190037f87e839b5492a1be82ea7caa95168effd5dfa729323c993ffee1'
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

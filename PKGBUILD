pkgname=hunspell-ga
pkgver=5.1
pkgrel=1
pkgdesc='Irish (Gaeilge) dictionary for Hunspell'
arch=('any')
url='https://github.com/kscanne/gaelspell'
license=('GPL2' 'FDL1.2')
depends=('hunspell')
source=(
"$pkgname-$pkgver.zip::https://github.com/kscanne/gaelspell/releases/download/v${pkgver}/${pkgname}-${pkgver}.zip")
md5sums=('73f4e6c8cb9fac405191633b7f3ae2ec')

package() {
	cd "$srcdir"

	install -dm755 "${pkgdir}"/usr/share/hunspell
    cp -p ga_IE.aff "${pkgdir}"/usr/share/hunspell/ga_IE.aff
    cp -p ga_IE.dic "${pkgdir}"/usr/share/hunspell/ga_IE.dic

	#myspell
    install -dm755 "${pkgdir}"/usr/share/myspell/dicts
    pushd "${pkgdir}"/usr/share/myspell/dicts
        for file in "${pkgdir}"/usr/share/hunspell/*; do
            ln -sv /usr/share/hunspell/"$(basename "${file}")" .
        done
    popd
    
    #docs
	install -dm755 ${pkgdir}/usr/share/doc/${pkgname}
	install -m644 README_ga_IE.txt ${pkgdir}/usr/share/doc/${pkgname}/
}
	 

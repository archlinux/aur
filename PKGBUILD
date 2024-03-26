# Maintainer:  vcalv

pkgname=knossu
pkgver=2015_10_14_1113
pkgrel=1
pkgdesc='A Doom-like non-euclidean horror game'
arch=('x86_64')
url='https://jonathanwhiting.com/games/knossu/'
license=('custom')
depends=(glew1.10 libpng12)
provides=('knossu')
options=('!strip' '!emptydirs')
source=(
    "${pkgname}-${pkgver}.zip::https://jonathanwhiting.com/games/knossu/knossu_linux64_${pkgver}.tgz"
	knossu.png
	knossu.desktop
	knossu.exe
)
sha512sums=('9338a41e6bb9f932eee691fe0ac4b68412005eb5c4eea8514d416fe456e5f7515eb56b12fb136fc654a87a4dfb3fec8feb2cf8421fbaf08768c1649fb3ecea97'
            'f6738e034fa9700f513e0a47ae06f35875a1015d3185f61786f52819afeb37ff5c855674c5f980be4e603aec8d8fa787c0362ddd23305f9803a2cd4b31913ffd'
            '1ef70c99114d25f83f852411fbeff168a1bbf6cb2a2a276e1612e0c504663fd7122d60dc9cf947c6d8a8f7a452957109fa35198ad4e9baf52a95ae466d7251f0'
            '5acba4ce096da6cea54490098d873e6c8e55d601b4a7208ffb5f3d653d97874458d3b4600e28f02f19e8562ec9da38a36446135f80b0af0bf0bba65af7b80ae1')

_installdir='/opt/knossu'

package() {
	_doc="${pkgdir}/usr/share/doc/${pkgname}"
	_src="knossu_linux64_${pkgver}"

    install -d "${_doc}"
    install -d "${pkgdir}/usr/bin/"
    install -d "${pkgdir}/${_installdir}"

	cp -r "${_src}"/* "${pkgdir}/${_installdir}"
	mv "${pkgdir}/${_installdir}"/README.txt "${_doc}"
	mv "${pkgdir}/${_installdir}"/knossu "${pkgdir}/${_installdir}"/knossu.exe

	install knossu.exe -T "${pkgdir}/${_installdir}"/knossu

	ln -s "${_installdir}/knossu" "${pkgdir}/usr/bin/knossu"

    install -Dt "$pkgdir/usr/share/applications/" "knossu.desktop"
    install -Dt "$pkgdir/usr/share/pixmaps/" "knossu.png"

}

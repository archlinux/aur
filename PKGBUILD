# Maintainer: Einhard Leichtfuß <alguien@respiranto.de>
_lang=deu-fra
pkgname=dict-freedict-${_lang}
pkgver=2016_11_20
_pkgver=${pkgver//_/-}
pkgrel=2
pkgdesc="German -> French dictionary for dictd et al. from Freedict.org"
arch=('any')
url="http://www.freedict.org/"
license=('GPL')
optdepends=('dictd: dict client and server')
makedepends=('dictd')
install=$pkgname.install
source=("https://sourceforge.net/projects/freedict/files/${_lang}/${_pkgver}/freedict-${_lang}-${_pkgver}.tar.bz2")
sha512sums=('53e046b368c9d1ce24410993a53f4a18e15844291f7ad497c79b72d5dac928c784bdd56a8f0d7151663c68208555248af54043e8877ebc9a22ade81e1da4dc02')

prepare()
{
	cd ${_lang}
	dictzip -d ${_lang}.dict.dz
	sed -i 's/\(10\)\(100\>.*1 mit 100 Nullen\)/\1\^\2/' ${_lang}.dict
	dictzip ${_lang}.dict
}

package()
{
	mkdir -p "$pkgdir/usr/share/dictd"
	cp ${_lang}/${_lang}.{dict.dz,index} "$pkgdir/usr/share/dictd/"
}

# Maintainer: Jin Asanami <hayatehay.njb at gmail dot com>

pkgname=kasumi-unicode
pkgver=2.6
pkgrel=2
pkgdesc='Dictionary management tool for anthy-unicode'
arch=('x86_64')
url='https://github.com/fujiwarat/kasumi-unicode'
license=('GPL-2.0-or-later')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags//${pkgver}.tar.gz"
	"cellrendererspin-73a6177.patch"
	"kasumimainwindow-1d00344.patch"
	"kasumiword-291c1cc.patch"
	"kasumiword-it-291c1cc.patch"
	"kasumiword-ja-291c1cc.patch")
sha512sums=('28072be62cf04bc3d80fdb00fb40e877afee0882136b77357c007949a54ec90100c5e415295d48eb2d811244945c7176ec6ad035e6d240219926aa1d6f14ff71'
            'bcfe6d09486361d4696659c8b2e110679c4593926e78039a800e58d842691c0c4531f05bc22d664ad022d559eec7b5c7ec6e5129eb15cdd67d81b0531af35bbe'
            'ecdb9be4cb72c13837fc41867a5b5e967c8c585cd915c7869a8f9451c9dd3b1a9a330c079129b3f5c3d7c9c1cfd3cba28d163f322f2bda4a3eb260e8f0db4893'
            '2ea58b51a3623b8e1356cdc14d8dfaf7ec8bbb0cfad5143a5f3d575153240e8bbefd7810a8bc88b693e4665b6ccba5adc294311768a43a37052ab1317e7b5a22'
            '91d9801ffa04d8b16fbed73cfa0e0b738f5f131714352f410fc6eb1517e54964cd059b26094ddc2f8d6d4171aa8f4693b1a89bb78e63cad2a16f3b299bbdda67'
            '02fa12e3fae9228058a12b842e8f8b17fb9fe30477d16fa9d69735bb99980a6ea70e8f03bfafe68cde76778ba3d9e143aadde8731c5209786fcfbc5f189cabdb')
depends=('anthy-unicode' 'gtk3')
#makedepends=('gcc12')
conflicts=('kasumi')

prepare(){
	cd "${srcdir}/${pkgname}-${pkgver}"
	patch --forward --strip=1 --input="${srcdir}/kasumiword-291c1cc.patch"
	patch --forward --strip=1 --input="${srcdir}/kasumiword-it-291c1cc.patch"
	patch --forward --strip=1 --input="${srcdir}/kasumiword-ja-291c1cc.patch"
	patch --forward --strip=1 --input="${srcdir}/cellrendererspin-73a6177.patch"
	patch --forward --strip=1 --input="${srcdir}/kasumimainwindow-1d00344.patch"
}

build() {
	export CFLAGS='-std=c89'
	export CXXFLAGS='-std=c++11'
	cd "${srcdir}/${pkgname}-${pkgver}"
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}

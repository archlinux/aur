# Maintainer: CupIvan <mail@cupivan.ru>
pkgname=quik
pkgver=10.0.0
pkgrel=1
pkgdesc="Trading terminal in Wine"
url="https://arqatech.com/ru/"
arch=('x86_64')
depends=('wine' 'unzip')

source=(
"ftp://ftp.quik.ru/public/updates/10.0/quik_${pkgver}_upd.zip"
"ftp://ftp.quik.ru/public/updates/9.7/StratVolat_3.0.3_upd.zip"
"ftp://ftp.quik.ru/public/updates/keygen_1.3.0_upd.zip"
)
sha256sums=(
'c78d0b3dc9ac176dd204d231f0324640c71b0da61eb0b862694627a851db1f0c'
'5b30484a29721a94ad46b939cc3241fb14fdff7ba5f5be7aae6b885ab1309a0e'
'bc66665d2209836abe51ae9258c289c0f682dba4ea5261f9319996a60a6a4ae7'
)

build() {
	mkdir -p "./usr/lib/quik"
	unzip "${srcdir}/quik_${pkgver}_upd.zip"   -d "./usr/lib/quik"
	unzip "${srcdir}/StratVolat_3.0.3_upd.zip" -d "./usr/lib/quik"

	mkdir -p "./usr/bin"

	echo "#!/bin/sh
mkdir -p ~/.config/quik
cd ~/.config/quik
rm -f info.log
wine /usr/lib/quik/info.exe" > "./usr/bin/quik"
	chmod +x ./usr/bin/quik

	mkdir -p "./usr/lib/quik/keygen"
	unzip "${srcdir}/keygen_1.3.0_upd.zip" -d "./usr/lib/quik/keygen"

	echo "#!/bin/sh
mkdir -p ~/.config/quik
cd ~/.config/quik
wine /usr/lib/quik/keygen/KeyGen.exe" > "./usr/bin/quik-keygen"
	chmod +x ./usr/bin/quik-keygen
}

package() {
	cp -r "./usr" "${pkgdir}"
}

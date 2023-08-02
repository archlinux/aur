# Maintainer: CupIvan <mail@cupivan.ru>
pkgname=quik
pkgver=10.3.1
pkgrel=1
stratver=3.0.5
pkgdesc="Trading terminal in Wine"
url="https://arqatech.com/ru/"
arch=('x86_64')
depends=('wine')
noextract=('keygen.zip')

source=(
"ftp://ftp.quik.ru/public/updates/10.3/quik_${pkgver}_upd.zip"
"ftp://ftp.quik.ru/public/updates/10.2/StratVolat_${stratver}_upd.zip"
"keygen.zip::ftp://ftp.quik.ru/public/updates/keygen_1.3.0_upd.zip"
'quik'
'quik-keygen'
'qrypto.cfg'
'ip.cfg'
)
sha256sums=(
'f6dcc750b9b066cb7a136900feb0014c766a61e387cd42f1ea18cd839c8c5197'
'd32095309cd7359f4078a74179d8ae42e013e3fd3ad75837f0fa3941e7091b75'
'bc66665d2209836abe51ae9258c289c0f682dba4ea5261f9319996a60a6a4ae7'
'133bcae46a8f0547603fb2f157b89bf4be59291bf9292695f723d7d5b1cf01dc'
'92563c563a9781592d1e119117e3b7a899addfabd733648986b97db999386821'
'd981ee4cc35d33a3b37c43fb7343bde5c24e15e003dbb67907b602d22f60a469'
'84b568313890e03bd373d24e7d4b782e921b2c81f61d2cbce8935d9e933ece78'
)

prepare() {
	mkdir -p keygen
	bsdtar -xzf keygen.zip -C keygen
}

package() {
	# quik
	install -Dm755 quik "${pkgdir}/usr/bin/quik"
	for fname in ./*.exe; do install -Dm755 $fname "${pkgdir}/usr/lib/quik/$fname"; done
	for fname in ./*.dll; do install -Dm644 $fname "${pkgdir}/usr/lib/quik/$fname"; done
	for fname in ./*.chm; do install -Dm644 $fname "${pkgdir}/usr/lib/quik/$fname"; done
	for fname in ./*.cfg; do install -Dm644 $fname "${pkgdir}/usr/lib/quik/$fname"; done

	# keygen
	install -Dm755 quik-keygen "${pkgdir}/usr/bin/"
	for fname in ./keygen/*.exe; do install -Dm755 $fname "${pkgdir}/usr/lib/quik/$fname"; done
	for fname in ./keygen/*.dll; do install -Dm644 $fname "${pkgdir}/usr/lib/quik/$fname"; done
	for fname in ./keygen/*.chm; do install -Dm644 $fname "${pkgdir}/usr/lib/quik/$fname"; done
}

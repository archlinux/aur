# Maintainer: david <xuwd1@hotmail.com>
pkgname=huawei-pixlab-series
pkgver=1.0_71
pkgrel=1
epoch=
pkgdesc="Driver support for HUAWEI pixlab series printers"
arch=('x86_64')
url="https://consumer.huawei.com/cn/support/printers/pixlab-x1/"
license=('custom')
groups=()
depends=(
	cups cups-filters cups-pdf dbus
)
makedepends=(
	rpm-tools
)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
	"${pkgname}-${pkgver}.zip::https://consumer-tkbdownload.huawei.com/ctkbfm/servlet/download/downloadServlet/H4sIAAAAAAAAAD2QS0_DMBCE_4vPTbWOjR-ccBJH4kKRWsSxcmqbrhTSKA9aivjvuFXEbWc1n2Y0P2Qew7D77gN5JDlZEX86d4sUSUZsw4v7vMnj7M4Bsx4vrWuyRGEY93QNmaT7i-DrK_YL8OqmYwK48gfFuNIMItcsakeFkkw2kcnoPEvuBq_PPlm3m6d3AMglVZDehyG4CU_dDm_JVIDmDDjQZFmRET86N83DvaKx3CqbW6mFqZTmRVnnBnJTWA0PYKhOjBBSaspqySqjispaVdZFyWy6U9aXa9G__Y8wDXO491pG2G7I7x9yg6VOJQEAAA%3D%3D.zip"
)
noextract=()
md5sums=(
	'7b72ea74d2f5a6dcbca249d58eb17dbb'
)
validpgpkeys=()

prepare() {
	echo " -> Cleaning HUAWEI's mind-blowing directory structure"
	_hypen_pkgver=$(echo ${pkgver}|sed 's/_/-/g')
	unzip ${srcdir}/${pkgname}_${_hypen_pkgver}_x64/${pkgname}_${_hypen_pkgver}_x64.zip 2>&1 > /dev/null
	mv ${srcdir}/${pkgname}_${_hypen_pkgver}_x64/x86_64 ${srcdir}/${pkgname}-${pkgver}
	cd ${pkgname}-${pkgver}
	rpm2archive *.rpm 2>&1 > /dev/null
	tar -xzf *.rpm.tgz 2>&1 > /dev/null
	cd ${srcdir}
	echo " -> Now it's much better"
}


package() {
	echo " -> Installing"
	# cups driver and hwthrvop gui app
	mkdir -p ${pkgdir}/usr/share
	cp -r ${srcdir}/${pkgname}-${pkgver}/usr/share/cups  ${pkgdir}/usr/share
	cp -r ${srcdir}/${pkgname}-${pkgver}/usr/share/hwthrvop  ${pkgdir}/usr/share
	# cups filter and hwthrvop lib
	mkdir -p ${pkgdir}/usr/lib
	cp -r ${srcdir}/${pkgname}-${pkgver}/usr/lib/cups  ${pkgdir}/usr/lib
	cp -r ${srcdir}/${pkgname}-${pkgver}/usr/lib/libhwthr*  ${pkgdir}/usr/lib
	# udev rules
	mkdir -p ${pkgdir}/etc/udev/rules.d
	cp ${srcdir}/${pkgname}-${pkgver}/etc/udev/rules.d/* ${pkgdir}/etc/udev/rules.d



	# hwthrvop pixmaps and desktop entry
	mkdir -p ${pkgdir}/usr/share/pixmaps
	cp ${srcdir}/${pkgname}-${pkgver}/usr/share/pixmaps/* ${pkgdir}/usr/share/pixmaps
	mkdir -p ${pkgdir}/usr/share/applications
	cp ${srcdir}/${pkgname}-${pkgver}/usr/share/applications/hwthrvop.desktop ${pkgdir}/usr/share/applications
	
	#license
	mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
	cp -r ${srcdir}/${pkgname}-${pkgver}/License/* ${pkgdir}/usr/share/licenses/${pkgname}/


	echo " -> Finished"
}



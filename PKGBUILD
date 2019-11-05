# Maintainer: hfte@posteo.org
pkgname=sws
pkgver=2.10.0.1
pkgrel=3
pkgdesc="A collection of features that seamlessly integrate into REAPER"
arch=('x86_64')
url="http://www.sws-extension.org/"
license=('MIT')
depends=('reaper-bin>=5.965')
makedepends=('git' 'gcc' 'make' 'php' 'php-gd')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("git://github.com/reaper-oss/sws.git"
	"git://github.com/justinfrankel/WDL.git/"
	"http://hosting121501.a2fb8.netcup.net/reaper_plugin_functions.h")
sha256sums=('SKIP'
	    'SKIP'
            '033f520e4e03e9311a1e0b7d65b9b00784c0c35f46da42cf7ca691db058a1be1')

pkgver() {
	cd "$pkgname"
	head -1 version.h | tr , . | cut -d' ' -f3
}

prepare() {
          cp "$srcdir/reaper_plugin_functions/reaper_plugin_functions.h"\
             "$srcdir/$pkgname"
}


build() {
	cd "$srcdir/$pkgname"
	git checkout next
	make
}


package() {
	DESTDIR="${pkgdir}/usr/lib/REAPER/UserPlugins/"
	mkdir -p "${DESTDIR}"
	cp "${srcdir}/$pkgname/reaper_sws64.so" "${DESTDIR}"
	cd "${srcdir}"
	cd ..
        mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}/"
	cp LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"
}

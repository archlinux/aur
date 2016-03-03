# Maintainer: Alex Zose <alexander.zosimidis[at]gmail[dot]com>
pkgname=gophish
pkgver=0.1.1
pkgrel=2
pkgdesc="Open-Source Phishing Framework"
url="https://getgophish.com/"
arch=("i686" "x86_64")
license=('MIT')
depends=('glibc')
install="gophish.install"
source_i686=("https://github.com/gophish/gophish/releases/download/v0.1.1/gophish_linux_32bit.tar.gz")
md5sums_i686=("adbdbeb7fb5206d5a2c6fa037fa31524")
source_x86_64=("https://github.com/gophish/gophish/releases/download/v0.1.1/gophish_linux_64bit.tar.gz")
md5sums_x86_64=("b627e109325276bd2dcbb83de222da1d")
source=("license"
	"gophish.service")
md5sums=("134df7ab3621c3b5e676e4357ec00f30"
	 "2b2d6aace9ebf753f06d6fd2ffaaf51d")
package() {
        mkdir -p ${pkgdir}/usr/bin
	mkdir -p ${pkgdir}/usr/share/gophish
	mkdir -p ${pkgdir}/usr/lib/systemd/system
	mkdir -p ${pkgdir}/usr/share/licenses/gophish
	case "$CARCH" in
		"i686") cp -r ${srcdir}/gophish_linux_386/{db,static,templates,config.json} ${pkgdir}/usr/share/gophish
                      cp ${srcdir}/gophish_linux_386/gophish ${pkgdir}/usr/bin ;;
		"x86_64") cp -r ${srcdir}/gophish_linux_amd64/{db,static,templates,config.json} ${pkgdir}/usr/share/gophish
		        cp ${srcdir}/gophish_linux_amd64/gophish ${pkgdir}/usr/bin ;;
	esac
	install -m644 license ${pkgdir}/usr/share/licenses/gophish
	install -m644 gophish.service ${pkgdir}/usr/lib/systemd/system
}

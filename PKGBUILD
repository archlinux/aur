# Maintainer: Alex Zose <alexander.zosimidis[at]gmail[dot]com>
pkgname=gophish
_pkg32bit=gophish_linux_32bit
_pkg64bit=gophish_linux_64bit
pkgver=0.1.2
pkgrel=1
pkgdesc="Open-Source Phishing Framework"
url="https://getgophish.com/"
arch=("i686" "x86_64")
license=('MIT')
depends=('glibc')
install="gophish.install"
source_i686=("https://github.com/gophish/gophish/releases/download/v0.1.2/${_pkg32bit}.zip")
md5sums_i686=("76d3f31b414680c1bbca38fe6058b3b7")
source_x86_64=("https://github.com/gophish/gophish/releases/download/v0.1.2/${_pkg64bit}.zip")
md5sums_x86_64=("a3209d15430c468a878bfbe3febd67ce")
source=("gophish.service")
md5sums=("2b2d6aace9ebf753f06d6fd2ffaaf51d")
package() {
        mkdir -p ${pkgdir}/usr/bin
        mkdir -p ${pkgdir}/usr/share/gophish
        mkdir -p ${pkgdir}/usr/lib/systemd/system
        mkdir -p ${pkgdir}/usr/share/licenses/gophish
        case "$CARCH" in
                "i686") cp -r ${srcdir}/${_pkg32bit}/{db,static,templates,config.json,CONTRIBUTING.md,README.md} ${pkgdir}/usr/share/gophish
                        cp ${srcdir}/${_pkg32bit}/LICENSE ${pkgdir}/usr/share/licenses/gophish
                        chmod +x ${srcdir}/${_pkg32bit}/gophish
                        cp ${srcdir}/${_pkg32bit}/gophish ${pkgdir}/usr/bin ;;
                "x86_64") cp -r ${srcdir}/${_pkg64bit}/{db,static,templates,config.json,CONTRIBUTING.md,README.md} ${pkgdir}/usr/share/gophish
                          cp ${srcdir}/${_pkg64bit}/LICENSE ${pkgdir}/usr/share/licenses/gophish
                          chmod +x ${srcdir}/${_pkg64bit}/gophish
                          cp ${srcdir}/${_pkg64bit}/gophish ${pkgdir}/usr/bin ;;
        esac
        install -m644 gophish.service ${pkgdir}/usr/lib/systemd/system
}

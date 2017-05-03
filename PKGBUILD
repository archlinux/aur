# Maintainer: Alex Zose <alexander.zosimidis[at]gmail[dot]com>
pkgname=gophish
pkgver=0.3.0
_pkgver=0.3
pkgrel=1
pkgdesc="Open-Source Phishing Framework"
url="https://getgophish.com/"
arch=("i686" "x86_64")
license=('MIT')
depends=('glibc')
install="gophish.install"
source_i686=("https://github.com/gophish/gophish/releases/download/v${pkgver}/${pkgname}-v${_pkgver}-linux-32bit.zip")
sha512sums_i686=("0e76803f43dbdd421df2d7f1469005f4584943dd6969ead0ec1bc8b6b8c21b488d0218588e32f9bca8df2deb5e22bfa8974b2e69b60cc8d278996adaccf5a8f9")
source_x86_64=("https://github.com/gophish/gophish/releases/download/v${pkgver}/${pkgname}-v${_pkgver}-linux-64bit.zip")
sha512sums_x86_64=("ba87b655811af3f7464ad6ef13d6c5d7d2fa6c83814a619869ae972679bd9872f1e92e7a72cdd6cca4d622f95f216b318226a497fd6771a8bca1dfb603192241")
source=("gophish.service")
sha512sums=("1204011f4b5da6caa87e13a949adfb535da0535f9b50bf1ce5f88307a2275cd15ecbf873d377ed65ad6b773c0df3fe857da48a8477e2cc3570d3b403083076c6")

package() {
        mkdir -p ${pkgdir}/usr/bin
        mkdir -p ${pkgdir}/usr/share/gophish
        mkdir -p ${pkgdir}/usr/share/doc/gophish
        mkdir -p ${pkgdir}/usr/lib/systemd/system
        mkdir -p ${pkgdir}/usr/share/licenses/gophish

        case "$CARCH" in
                "i686") cp -r ${srcdir}/${pkgname}-v${_pkgver}-linux-32bit/{static,templates,db,config.json} ${pkgdir}/usr/share/gophish
                        cp ${srcdir}/${pkgname}-v${_pkgver}-linux-32bit/doc/* ${pkgdir}/usr/share/doc/gophish
                        cp ${srcdir}/${pkgname}-v${_pkgver}-linux-32bit/{README.md,CONTRIBUTING.md} ${pkgdir}/usr/share/doc/gophish
                        cp ${srcdir}/${pkgname}-v${_pkgver}-linux-32bit/LICENSE ${pkgdir}/usr/share/licenses/gophish
                        chmod +x ${srcdir}/${pkgname}-v${_pkgver}-linux-32bit/gophish
                        cp ${srcdir}/${pkgname}-v${_pkgver}-linux-32bit/gophish ${pkgdir}/usr/bin ;;
                "x86_64") cp -r ${srcdir}/${pkgname}-v${_pkgver}-linux-64bit/{static,templates,db,config.json} ${pkgdir}/usr/share/gophish
                          cp ${srcdir}/${pkgname}-v${_pkgver}-linux-64bit/doc/* ${pkgdir}/usr/share/doc/gophish
                          cp ${srcdir}/${pkgname}-v${_pkgver}-linux-64bit/{README.md,CONTRIBUTING.md} ${pkgdir}/usr/share/doc/gophish
                          cp ${srcdir}/${pkgname}-v${_pkgver}-linux-64bit/LICENSE ${pkgdir}/usr/share/licenses/gophish
                          chmod +x ${srcdir}/${pkgname}-v${_pkgver}-linux-64bit/gophish
                          cp ${srcdir}/${pkgname}-v${_pkgver}-linux-64bit/gophish ${pkgdir}/usr/bin ;;
 
        esac

        install -m644 gophish.service ${pkgdir}/usr/lib/systemd/system
}

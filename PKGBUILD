# Maintainer: Alex Zose <alexander.zosimidis[at]gmail[dot]com>
pkgname=gophish
pkgver=0.4.0
_pkgver=0.4
pkgrel=1
pkgdesc="Open-Source Phishing Framework"
url="https://getgophish.com/"
arch=("i686" "x86_64")
license=('MIT')
depends=('glibc')
install="gophish.install"
source_i686=("https://github.com/gophish/gophish/releases/download/v${pkgver}/${pkgname}-v${_pkgver}-linux-32bit.zip")
sha512sums_i686=("5a6ac6daa43fb2f66ab900861333d5cede110dbc2fe6a7aa2e5bea241bc908b9fe8ded33ed05b9169a00fb326913b687a7ee7d59c4399f075cd30a386dd37c79")
source_x86_64=("https://github.com/gophish/gophish/releases/download/v${pkgver}/${pkgname}-v${_pkgver}-linux-64bit.zip")
sha512sums_x86_64=("3fb9c8b93394be7f95fc830e6f206d10ea7f764a33d137b9fe281035290e3140479082798870131cec91ac8b5aa2fd5048eac3755f33d30e9e6cc8be13474d08")
source=("gophish.service")
sha512sums=("1204011f4b5da6caa87e13a949adfb535da0535f9b50bf1ce5f88307a2275cd15ecbf873d377ed65ad6b773c0df3fe857da48a8477e2cc3570d3b403083076c6")

package() {
        mkdir -p ${pkgdir}/usr/bin
        mkdir -p ${pkgdir}/usr/share/gophish
        mkdir -p ${pkgdir}/usr/share/doc/gophish
        mkdir -p ${pkgdir}/usr/lib/systemd/system
        mkdir -p ${pkgdir}/usr/share/licenses/gophish

        case "$CARCH" in
                "i686") cp -r ${srcdir}/${pkgname}-v${_pkgver}-linux-32bit/{ansible-playbook,db,static,templates,VERSION,config.json} ${pkgdir}/usr/share/gophish
                        cp ${srcdir}/${pkgname}-v${_pkgver}-linux-32bit/doc/* ${pkgdir}/usr/share/doc/gophish
                        cp ${srcdir}/${pkgname}-v${_pkgver}-linux-32bit/{README.md,CONTRIBUTING.md} ${pkgdir}/usr/share/doc/gophish
                        cp ${srcdir}/${pkgname}-v${_pkgver}-linux-32bit/LICENSE ${pkgdir}/usr/share/licenses/gophish
                        chmod +x ${srcdir}/${pkgname}-v${_pkgver}-linux-32bit/gophish
                        cp ${srcdir}/${pkgname}-v${_pkgver}-linux-32bit/gophish ${pkgdir}/usr/bin ;;
                "x86_64") cp -r ${srcdir}/${pkgname}-v${_pkgver}-linux-64bit/{ansible-playbook,db,static,templates,VERSION,config.json} ${pkgdir}/usr/share/gophish
                          cp ${srcdir}/${pkgname}-v${_pkgver}-linux-64bit/doc/* ${pkgdir}/usr/share/doc/gophish
                          cp ${srcdir}/${pkgname}-v${_pkgver}-linux-64bit/{README.md,CONTRIBUTING.md} ${pkgdir}/usr/share/doc/gophish
                          cp ${srcdir}/${pkgname}-v${_pkgver}-linux-64bit/LICENSE ${pkgdir}/usr/share/licenses/gophish
                          chmod +x ${srcdir}/${pkgname}-v${_pkgver}-linux-64bit/gophish
                          cp ${srcdir}/${pkgname}-v${_pkgver}-linux-64bit/gophish ${pkgdir}/usr/bin ;;
 
        esac

        install -m644 gophish.service ${pkgdir}/usr/lib/systemd/system
}

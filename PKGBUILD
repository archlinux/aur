# Maintainer: Alex Zose <alexander.zosimidis[at]gmail[dot]com>
pkgname=gophish
pkgver=0.2.0
pkgrel=1
pkgdesc="Open-Source Phishing Framework"
url="https://getgophish.com/"
arch=("i686" "x86_64")
license=('MIT')
depends=('glibc')
install="gophish.install"
source_i686=("https://github.com/gophish/gophish/releases/download/v${pkgver}/${pkgname}-v0.2-linux-32bit.zip")
sha512sums_i686=("3e0bc4b421b66726c058f160fcc7a783907662b0c59ffa21df174a2e10d1da6bed5af5be498ccfe07c426c6bdc843283bfd84a2c417cb3be50d93c5fcbf8c0c1")
source_x86_64=("https://github.com/gophish/gophish/releases/download/v${pkgver}/${pkgname}-v0.2-linux-64bit.zip")
sha512sums_x86_64=("ea4c57a9b970ae28776c4ab0f13840fea866448ed05004968160ae9fa873cff0f50f8e7a05cffc8321fc7d316114b05ab7aef35553f0c95198a624156aa13a65")
source=("gophish.service")
sha512sums=("1204011f4b5da6caa87e13a949adfb535da0535f9b50bf1ce5f88307a2275cd15ecbf873d377ed65ad6b773c0df3fe857da48a8477e2cc3570d3b403083076c6")

package() {
        mkdir -p ${pkgdir}/usr/bin
        mkdir -p ${pkgdir}/usr/share/gophish
        mkdir -p ${pkgdir}/usr/share/doc/gophish
        mkdir -p ${pkgdir}/usr/lib/systemd/system
        mkdir -p ${pkgdir}/usr/share/licenses/gophish

        case "$CARCH" in
                "i686") cp -r ${srcdir}/${pkgname}-v0.2-linux-32bit/{static,templates,db,config.json} ${pkgdir}/usr/share/gophish
                        cp ${srcdir}/${pkgname}-v0.2-linux-32bit/doc/* ${pkgdir}/usr/share/doc/gophish
                        cp ${srcdir}/${pkgname}-v0.2-linux-32bit/{README.md,CONTRIBUTING.md} ${pkgdir}/usr/share/doc/gophish
                        cp ${srcdir}/${pkgname}-v0.2-linux-32bit/LICENSE ${pkgdir}/usr/share/licenses/gophish
                        chmod +x ${srcdir}/${pkgname}-v0.2-linux-32bit/gophish
                        cp ${srcdir}/${pkgname}-v0.2-linux-32bit/gophish ${pkgdir}/usr/bin ;;
                "x86_64") cp -r ${srcdir}/${pkgname}-v0.2-linux-64bit/{static,templates,db,config.json} ${pkgdir}/usr/share/gophish
                          cp ${srcdir}/${pkgname}-v0.2-linux-64bit/doc/* ${pkgdir}/usr/share/doc/gophish
                          cp ${srcdir}/${pkgname}-v0.2-linux-64bit/{README.md,CONTRIBUTING.md} ${pkgdir}/usr/share/doc/gophish
                          cp ${srcdir}/${pkgname}-v0.2-linux-64bit/LICENSE ${pkgdir}/usr/share/licenses/gophish
                          chmod +x ${srcdir}/${pkgname}-v0.2-linux-64bit/gophish
                          cp ${srcdir}/${pkgname}-v0.2-linux-64bit/gophish ${pkgdir}/usr/bin ;;
 
        esac

        install -m644 gophish.service ${pkgdir}/usr/lib/systemd/system
}

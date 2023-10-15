# Maintainer: Osman Karagoz <osmank3[at]gmail[dot]com>
# Maintainer: oltulu <cihanalk@gmail.com>

pkgname=uyap
pkgver=5.4.7
pkgrel=1
pkgdesc="UYAP Dokuman Editor, UYAP Sablon Editor"
arch=("x86_64")
url="https://uyap.gov.tr/UYAP-Editor"
license=("custom")
install=uyap.install
depends=("pcsclite" "java-environment<=11")
optdepends=("akia: sign UYAP documents"
	    "jre8: sign UYAP documents"
	    "cups: print documents")
source=("http://depo.pardus.org.tr/pardus/pool/non-free/u/uyapeditor/uyapeditor_${pkgver}_amd64.deb"
        desktop-files.patch
        java-location.patch)
sha256sums=("dfb95dca8690e60ba8a81b069c5e5c69e1264528f0a8e18fe16895107d4f72e5"
            "19f36882522f236b3e48049c810079cf0ddfb21b76ad2da84e9b70550df4ac19"
            "50a2339b4a467218fd614cb95ebd12b34a2c8d52cf61e6f10a2286605e47c126")

prepare() {
    ar x uyapeditor_${pkgver}_amd64.deb
    tar -Jxf ${srcdir}/data.tar.xz -C "${srcdir}"
    patch --forward --strip=1 --input="desktop-files.patch"
    patch --forward --strip=1 --input="java-location.patch"
}

package() {
    mv "${srcdir}"/usr "${pkgdir}"/usr
    mkdir -p "${pkgdir}"/usr/bin
    ln -s /usr/share/UYAPEditor/dokuman.sh "${pkgdir}"/usr/bin/uyapeditor
    ln -s /usr/share/UYAPEditor/sablon.sh "${pkgdir}"/usr/bin/uyapsablon
}

# Maintainer: Osman Karagoz <osmank3[at]gmail[dot]com>
# Maintainer: oltulu <cihanalk@gmail.com>
DLAGENTS=("https::/usr/bin/curl -k -o %o %u")

pkgname=uyap
pkgver=5.4.5
pkgrel=2
pkgdesc="UYAP Dokuman Editor, UYAP Sablon Editor"
arch=("x86_64")
url="https://uyap.gov.tr/UYAP-Editor"
license=("custom")
install=uyap.install
depends=("pcsclite" "java-environment<=11")
optdepends=("akia: sign UYAP documents"
	    "jre8: sign UYAP documents"
	    "cups: print documents")
source=("https://rayp.adalet.gov.tr/resimler/2/dosya/uyap-pardus-5-4-5-amd6412-09-20224-09-pm.zip"
        desktop-files.patch)
sha256sums=("155af22345c7b9ff4451702735b79a5b2404e2cda44c758927ef89c0a7c84ca9"
            "19f36882522f236b3e48049c810079cf0ddfb21b76ad2da84e9b70550df4ac19")

prepare() {
    ar x uyap_pardus_5_4_5_amd64/uyapeditor_5.4.5_amd64.deb
    tar -Jxf ${srcdir}/data.tar.xz -C "${srcdir}"
    patch --forward --strip=1 --input="desktop-files.patch"
}

package() {
    mv "${srcdir}"/usr "${pkgdir}"/usr
    mkdir -p "${pkgdir}"/usr/bin
    ln -s /usr/share/UYAPEditor/dokuman.sh "${pkgdir}"/usr/bin/uyapeditor
    ln -s /usr/share/UYAPEditor/sablon.sh "${pkgdir}"/usr/bin/uyapsablon
}

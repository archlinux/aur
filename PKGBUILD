# Maintainer: Osman Karagoz <osmank3[at]gmail[dot]com>
# Maintainer: oltulu <cihanalk@gmail.com>
DLAGENTS=("https::/usr/bin/curl -k -o %o %u")

pkgname=uyap
pkgver=5.4.0
pkgrel=1
pkgdesc="UYAP Dokuman Editor, UYAP Sablon Editor"
arch=("x86_64")
url="https://uyap.gov.tr/UYAP-Editor"
license=("custom")
depends=("pcsclite" "java-environment")
optdepends=("akia: sign UYAP documents"
	    "jre8: sign UYAP documents"
	    "cups: print documents")
source=("https://rayp.adalet.gov.tr/resimler/2/dosya/uyap-pardus-5-4-0-amd6420-12-20219-21-am.zip"
        desktop-files.patch)
sha256sums=("2394f9b712ca2e2d905901642992fd736e0c972b0e5f72303e06cf9cebd7b2f1"
            "19f36882522f236b3e48049c810079cf0ddfb21b76ad2da84e9b70550df4ac19")

prepare() {
    ar x uyap_pardus_5_4_0_amd64/uyapeditor_5.4.0_amd64.deb
    tar -Jxf ${srcdir}/data.tar.xz -C "${srcdir}"
    patch --forward --strip=1 --input="desktop-files.patch"
    mkdir -p "${srcdir}"/usr/bin
    mv "${srcdir}"/usr/share/UYAPEditor/dokuman.sh "${srcdir}"/usr/bin/uyapeditor
    mv "${srcdir}"/usr/share/UYAPEditor/sablon.sh "${srcdir}"/usr/bin/uyapsablon
}

package() {
    mv "${srcdir}"/usr "${pkgdir}"/usr
}

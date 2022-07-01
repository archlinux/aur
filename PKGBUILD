# Maintainer: Osman Karagoz <osmank3[at]gmail[dot]com>
# Maintainer: oltulu <cihanalk@gmail.com>
DLAGENTS=("https::/usr/bin/curl -k -o %o %u")

pkgname=uyap
pkgver=5.4.2
pkgrel=1
pkgdesc="UYAP Dokuman Editor, UYAP Sablon Editor"
arch=("x86_64")
url="https://uyap.gov.tr/UYAP-Editor"
license=("custom")
depends=("pcsclite" "java-environment")
optdepends=("akia: sign UYAP documents"
	    "jre8: sign UYAP documents"
	    "cups: print documents")
source=("https://rayp.adalet.gov.tr/resimler/2/dosya/uyap-pardus-5-4-2-amd6416-06-20224-03-pm.zip"
        desktop-files.patch)
sha256sums=("aa73313cf35e8c95855d74911b1f08b0dd233355b0b2eac36c71a250daae6145"
            "19f36882522f236b3e48049c810079cf0ddfb21b76ad2da84e9b70550df4ac19")

prepare() {
    ar x uyap_pardus_5_4_2_amd64/uyapeditor_5.4.2_amd64.deb
    tar -Jxf ${srcdir}/data.tar.xz -C "${srcdir}"
    patch --forward --strip=1 --input="desktop-files.patch"
    mkdir -p "${srcdir}"/usr/bin
    mv "${srcdir}"/usr/share/UYAPEditor/dokuman.sh "${srcdir}"/usr/bin/uyapeditor
    mv "${srcdir}"/usr/share/UYAPEditor/sablon.sh "${srcdir}"/usr/bin/uyapsablon
}

package() {
    mv "${srcdir}"/usr "${pkgdir}"/usr
}

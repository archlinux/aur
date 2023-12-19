# Maintainer: Osman Karagoz <osmank3[at]gmail[dot]com>
# Maintainer: oltulu <cihanalk@gmail.com>

pkgname=uyap
pkgver=5.4.11
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
source=("https://rayp.adalet.gov.tr/resimler/2/dosya/uyap-pardus-5-4-11-amd6411-12-202310-13-am.zip"
        desktop-files.patch)
sha256sums=("815625d4dda08948992323c3b401c60d9464d7e923bcdbaf8e9bcf4bc66e316f"
            "19f36882522f236b3e48049c810079cf0ddfb21b76ad2da84e9b70550df4ac19")

prepare() {
    ar x uyap_pardus_5_4_11_amd64/uyapeditor_5.4.11_amd64.deb
    tar -Jxf ${srcdir}/data.tar.xz -C "${srcdir}"
    patch --forward --strip=1 --input="desktop-files.patch"
}

package() {
    mv "${srcdir}"/usr "${pkgdir}"/usr
    mkdir -p "${pkgdir}"/usr/bin
    ln -s /usr/share/UYAPEditor/dokuman.sh "${pkgdir}"/usr/bin/uyapeditor
    ln -s /usr/share/UYAPEditor/sablon.sh "${pkgdir}"/usr/bin/uyapsablon
}

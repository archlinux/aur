# Maintainer: Osman Karagoz <osmank3[at]gmail[dot]com>
# Maintainer: oltulu <cihanalk@gmail.com>

pkgname=uyap
pkgver=5.4.12
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
source=("https://rayp.adalet.gov.tr/resimler/2/dosya/pardus541230-12-20241-59-pm.zip"
        desktop-files.patch)
sha256sums=("846d1410064cc77705faf58cea56414fbe9501639a1d92573319fce6aef2e600"
            "19f36882522f236b3e48049c810079cf0ddfb21b76ad2da84e9b70550df4ac19")

prepare() {
    ar x uyap_pardus_5_4_12_amd64/uyapeditor_5.4.12_amd64.deb
    tar --zstd -xf ${srcdir}/data.tar.zst -C "${srcdir}"
    patch --forward --strip=1 --input="desktop-files.patch"
}

package() {
    mv "${srcdir}"/usr "${pkgdir}"/usr
    mkdir -p "${pkgdir}"/usr/bin
    ln -s /usr/share/UYAPEditor/dokuman.sh "${pkgdir}"/usr/bin/uyapeditor
    ln -s /usr/share/UYAPEditor/sablon.sh "${pkgdir}"/usr/bin/uyapsablon
}

# Maintainer: Tomasz Zok <tomasz.zok [at] gmail.com>
pkgname=xplor-nih
pkgver=2.41.1
pkgrel=1
pkgdesc="XPLOR-NIH is a structure determination program which builds on the X-PLOR program, including additional tools developed at the NIH"
arch=('x86_64')
url="https://nmr.cit.nih.gov/xplor-nih/"
license=('custom')
install=${pkgname}.install
source=("LICENSE")
md5sums=('de4f34dc4d9738669b57850f7ef77a71')

prepare() {
    if [[ ! -r "../${pkgname}-${pkgver}-db.tar.gz" || ! -r "../${pkgname}-${pkgver}-Linux_x86_64.tar.gz" ]]; then
        echo "You must download XPLOR-NIH on your own from the project webpage: ${pkgname}-${pkgver}-db.tar.gz and ${pkgname}-${pkgver}-Linux_x86_64.tar.gz"
        return 1
    fi

    bsdtar xfz ../${pkgname}-${pkgver}-db.tar.gz
    bsdtar xfz ../${pkgname}-${pkgver}-Linux_x86_64.tar.gz
}

package() {
    install -d "${pkgdir}/etc/profile.d/"
    install -d "${pkgdir}/opt/"

    echo "export PATH=\$PATH:/opt/${pkgname}-${pkgver}/bin:/opt/${pkgname}-${pkgver}/bin.Linux_x86_64" > "${pkgdir}/etc/profile.d/${pkgname}.sh"
	cp -R "${pkgname}-${pkgver}" "${pkgdir}/opt/"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# Maintainer: Indexyz <jiduye@gmail.com>

pkgname=finalshell
pkgver=2.2
pkgrel=2
pkgdesc="A Linux SSH Application."
arch=(i686 x86_64)
url="http://www.hostbuf.com/t/989.html"
license=('custom')
makedepends=('bin32-jre' 'curl' 'unzip')
source=("http://www.hostbuf.com/downloads/finalshell_data.zip")
noextract=("finalshell_data.zip")
sha256sums=('SKIP')

prepare() {
    cd "${srcdir}"
    rm -rf "${srcdir}"/finalshelldata
    unzip "${srcdir}"/finalshell_data.zip
}

build() {
    cd "${srcdir}"/finalshelldata
    unpack200 finalshell.pack.gz finalshell.jar
}

package() {
    cd "${srcdir}"
    mkdir -p ${pkgdir}/usr/lib
    cp -rf finalshelldata ${pkgdir}/usr/lib
    cd "${srcdir}"/finalshelldata
    sed -i 's/sudo\ -b //g' "${pkgdir}"/usr/lib/finalshelldata/start

    mkdir -p "${pkgdir}"/usr/share/icons/hicolor/scalable/apps
    mkdir -p "${pkgdir}"/usr/share/applications

    install -m 644 img/finalshell.png "${pkgdir}"/usr/share/icons/hicolor/scalable/apps
    install -m 644 finalshell.desktop "${pkgdir}"/usr/share/applications

    chmod -R 777 "${pkgdir}"/usr/lib/finalshelldata
    chmod +x "${pkgdir}"/usr/lib/finalshelldata/start
}

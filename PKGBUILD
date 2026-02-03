# Maintainer: Richard Cesar <richard.cesar@netkeepers.cz>

pkgname=flexibee-client-bin
pkgver=2026.2.0
pkgbasever=2026.2
pkgrel=1
pkgdesc="Accounting economic system for person and business usage. Client-only package."
arch=('i686' 'x86_64')
url="http://www.flexibee.eu"
license=('custom')
depends=('glibc' 'java-environment=11' 'fontconfig' 'libxrender' 'libxtst' 'ttf-dejavu' 'gtk3' 'ttf-dejavu' 'libxi')
install=flexibee.install
source=("https://download.flexibee.eu/download/$pkgbasever/$pkgver/flexibee-client_${pkgver}_all.deb")

sha256sums=('8030656857424d1364beda52cdf143a2dcdbe3c1e2ff9ab0ed2562294ab4cf1c')

prepare() {
    cd ${srcdir}
    mkdir $pkgname-$pkgver
    tar -vxzf data.tar.gz -C ./$pkgname-$pkgver
    #sed -i 's/^# FLEXIBEE_JAVA=$/FLEXIBEE_JAVA=\/usr\/lib\/jvm\/java-11-openjdk\/jre\/bin\/java/' ./$pkgname-$pkgver/etc/default/flexibee
}

package() {

    cd ${srcdir}/$pkgname-$pkgver

    # Prepare /etc
    install -d -m 755 "${pkgdir}/etc/flexibee"
    install -d -m 755 "${pkgdir}/etc/default"
    install -m 644 ./etc/default/flexibee "${pkgdir}/etc/default/"

    # Prepare /usr/bin -> install executables
    install -d -m 755 "${pkgdir}/usr/bin"
    install -m 755 ./usr/bin/* "${pkgdir}/usr/bin/"

    # Install everything in /usr/share
    install -d -m 755 "${pkgdir}/usr/share"
    find ./usr/share/ -type d -exec install -d -m 755 {} "${pkgdir}/{}" \;
    find ./usr/share/ -type f -exec install -m 664 {} "${pkgdir}/{}" \;
}



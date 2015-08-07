# Maintainer: Javier Torres <javitonino [at] gmail [dot] com>

pkgname=kolab-syncroton
pkgver=2.3.2
pkgrel=1
pkgdesc='ActiveSync Kolab Backend for Syncroton'
arch=('any')
license=('GPL3')
depends=('roundcubemail-plugins-kolab' 'php-kolabformat')
url="http://kolab.org"
source=("http://mirror.kolabsys.com/pub/releases/${pkgname}-${pkgver}.tar.gz"
        "apache.patch")
optdepends=('pykolab: configuration tool')

sha256sums=('80241e25e1541c383cdfb28e527d1a863a33a774fe2bbb085e4dc9c75d145a28'
            'ca7860ec91bcffe3fc328204069d8580779d1164fb7262f0c5724b81d987faf3')


prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    
    patch -p1 < "${srcdir}/apache.patch"
}
            
package() {
    mkdir -p "${pkgdir}/usr/share/webapps/${pkgname}"
    cp -dr --no-preserve=ownership "$srcdir/${pkgname}-${pkgver}/index.php" "${pkgdir}/usr/share/webapps/${pkgname}"
    cp -dr --no-preserve=ownership "$srcdir/${pkgname}-${pkgver}/lib" "${pkgdir}/usr/share/webapps/${pkgname}"
    
    mkdir -p "${pkgdir}/usr/share/doc"
    cp -dr --no-preserve=ownership "$srcdir/${pkgname}-${pkgver}/docs" "${pkgdir}/usr/share/doc/${pkgname}"
    
    mkdir -p "${pkgdir}/var/log/${pkgname}"
    ln -s "/var/log/${pkgname}" "${pkgdir}/usr/share/webapps/${pkgname}/logs"
    
    mkdir -p "${pkgdir}/var/cache/${pkgname}"
    ln -s "/var/cache/${pkgname}" "${pkgdir}/usr/share/webapps/${pkgname}/temp"
    
    ln -s "/etc/webapps/roundcubemail/config" "${pkgdir}/usr/share/webapps/${pkgname}/config"
}

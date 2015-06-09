# Maintainer: Javier Torres <javitonino [at] gmail [dot] com>

pkgname=kolab-syncroton
pkgver=2.3.1
pkgrel=1
pkgdesc='ActiveSync Kolab Backend for Syncroton'
arch=('any')
license=('GPL3')
depends=('roundcubemail-plugins-kolab' 'php-kolabformat')
url="http://kolab.org"
source=("http://mirror.kolabsys.com/pub/releases/${pkgname}-${pkgver}.tar.gz"
        "apache.patch")
optdepends=('pykolab: configuration tool')

sha256sums=('94a5056c89a7711ae46b1acea9bc3076190adcf80e9d7145adea4d23ce828be4'
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

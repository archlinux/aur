# Contributor: MartiMcFly <martimcfly@autorisation.de>

pkgname='postfixadmin-zarafa'
pkgver=0.1
pkgrel=1
pkgdesc="Customization for default Postfixadmin to be able to manage Zarafa-Server with DB-Plugin."
arch=('any')
license=('GPL')
url="https://git.pietma.com/pietma/postfixadmin-zarafa"
depends=('postfixadmin'
	 'zarafa-server')
source=("${pkgname}-${pkgver}::git+https://git.pietma.com/pietma/postfixadmin-zarafa.git#tag=v${pkgver}")
md5sums=('SKIP')

package() {
    # Prepare destinations
    _destdir=${pkgdir}/usr/share/${pkgname}
    _destdir_systemd=${pkgdir}/usr/lib/systemd/system    
    _destdir_etc=${pkgdir}/etc/${pkgname}
    _destdir_doc=${pkgdir}/usr/share/doc/${pkgname}
    _destdir_lib=${pkgdir}/var/lib/${pkgname}

    install -dm755 ${_destdir}
    install -dm755 ${_destdir_etc}
    install -dm755 ${_destdir_doc}
    install -dm755 ${_destdir_lib}

    # usr
    cd ${srcdir}/$pkgname-$pkgver
    cp ${pkgname}.sh ${_destdir}

    mkdir -p ${_destdir_systemd}
    cp ${pkgname}.service ${_destdir_systemd}
    cp ${pkgname}.timer ${_destdir_systemd}
    
    # var
    touch ${_destdir_lib}/lastlog
  
    # docs
    cp config.zarafa.php ${_destdir_doc}/config-example.zarafa.php
    
    # etc
    cp config.zarafa.php ${_destdir_etc}/config.zarafa.php

    # TODO installskript for include!
}

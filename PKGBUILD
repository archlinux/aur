# Contributor: James Thomas <dairy_water at yahoo dot co dot uk>
pkgname=epubcheck
pkgver=4.0.1
pkgrel=4
pkgdesc="A tool to validate IDPF Epub files."
arch=('any')
url="https://github.com/IDPF/epubcheck"
license=('BSD')
depends=('java-environment')
source=(https://github.com/IDPF/epubcheck/releases/download/v${pkgver}/${pkgname}-${pkgver}.zip)    
md5sums=('e5834be417b8e9ddcdb1498929ecd41e')

package() {
    mkdir -p $pkgdir/usr/share/java/${pkgname}
    install -D -m644 $srcdir/${pkgname}-${pkgver}/epubcheck.jar $pkgdir/usr/share/java/${pkgname}    
    mkdir -p $pkgdir/usr/share/java/${pkgname}/lib
    install -D -m644 $srcdir/${pkgname}-${pkgver}/lib/*.jar $pkgdir/usr/share/java/${pkgname}/lib 
    mkdir -p $pkgdir/usr/share/docs/${pkgname}
    install -D -m644 $srcdir/${pkgname}-${pkgver}/*.txt $pkgdir/usr/share/docs/${pkgname} 
    mkdir -p $pkgdir/usr/share/licenses/${pkgname}
    install -D -m644 $srcdir/${pkgname}-${pkgver}/licenses/BSD-3-Clause.txt $pkgdir/usr/share/licenses/${pkgname}/LICENSE
    
    mkdir -p $pkgdir/usr/bin
    
    cat >> $pkgdir/usr/bin/${pkgname} << EOF 
#!/bin/bash
exec /usr/bin/java -jar '/usr/share/java/epubcheck/epubcheck.jar' "\$@"
EOF
    chmod +x $pkgdir/usr/bin/${pkgname}
}


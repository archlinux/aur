# Contributor: James Thomas <dairy_water at yahoo dot co dot uk>
pkgname=epubcheck
pkgver=4.0.1
pkgrel=7
pkgdesc="A tool to validate epub files."
arch=('any')
url="https://github.com/IDPF/epubcheck"
license=('BSD')
depends=('java-environment')
source=("epubcheck.1" "https://github.com/IDPF/epubcheck/releases/download/v${pkgver}/${pkgname}-${pkgver}.zip")    
md5sums=('28b6a51045dab25a156ffc2fc8a4f20d'
         'e5834be417b8e9ddcdb1498929ecd41e')

package() {
    
    install -d "$pkgdir/usr/share"/{java,docs,licenses}/"${pkgname}" "$pkgdir/usr/share/java/${pkgname}/lib"
    install -m644 "$srcdir/${pkgname}-${pkgver}/epubcheck.jar" "$pkgdir/usr/share/java/${pkgname}/epubcheck.jar"    
    install -m644 "$srcdir/${pkgname}-${pkgver}/lib"/*.jar "$pkgdir/usr/share/java/${pkgname}/lib"
    install -m644 "$srcdir/${pkgname}-${pkgver}"/*.txt "$pkgdir/usr/share/docs/${pkgname}"
    install -m644 "$srcdir/${pkgname}-${pkgver}/licenses/BSD-3-Clause.txt" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
    
    install -D -m644 "$srcdir/epubcheck.1" "$pkgdir/usr/share/man/man1/epubcheck.1"
    
    mkdir -p "$pkgdir/usr/bin"
    
    cat >> "$pkgdir/usr/bin/${pkgname}" << EOF 
#!/bin/bash
exec /usr/bin/java -jar '/usr/share/java/epubcheck/epubcheck.jar' "\$@"
EOF
    chmod +x "$pkgdir/usr/bin/${pkgname}"
}



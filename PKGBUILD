# Contributor: James Thomas <notrevolution at gmail dot com>
pkgname=epubcheck
pkgver=4.0.2
pkgrel=1
pkgdesc="A tool to validate epub files."
arch=('any')
url="https://github.com/IDPF/epubcheck"
license=('BSD')
depends=('java-environment')
makedepends=('unzip')
source=("epubcheck.1" "https://github.com/IDPF/epubcheck/releases/download/v${pkgver}/${pkgname}-${pkgver}.zip")    
noextract=("${pkgname}-${pkgver}.zip")
sha512sums=('f15527b6283053d3ae8e03679ed011b75b52e1d14b765a49565d17bb7d2aad785d57db477a692a3df89bfcacf80b03c7c98d652946d03ceb343edc48f40a635d'
            'c6d87b6bf721120de439a4984282a9900bfc446d9471eb6eb1abba2ce5ff7d270fe2baac8022701e877ac339948f5f06c9a56cf87f881f3fa309e072a3536a2f')

build() {

        cd $srcdir
        unzip "${pkgname}-${pkgver}.zip"

}
            
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



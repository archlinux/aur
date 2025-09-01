pkgname=goenv
pkgver=2.2.28
pkgrel=1
pkgdesc="Like pyenv and rbenv, but for Go."
arch=('i686' 'x86_64')
url="https://github.com/syndbg/goenv"
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('b63de7cc977cdafc84ac7ddb263b068de1204b5ee4e4d2d40d72d68b37e9a9ff')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    
    for file in libexec/*; do
        install -D -m755 "$file" "${pkgdir}/usr/lib/goenv/$file"
    done
    
    for file in bin/*; do
        install -D -m755 "$file" "${pkgdir}/usr/lib/goenv/$file"
    done
    
    if [ -d "${srcdir}/${pkgname}-${pkgver}/plugins/go-build" ]; then
        install -d "${pkgdir}/usr/lib/goenv/plugins/go-build"
        cp -r "${srcdir}/${pkgname}-${pkgver}/plugins/go-build/"* "${pkgdir}/usr/lib/goenv/plugins/go-build/"
    fi
    
    install -d "${pkgdir}/usr/bin"
    ln -s /usr/lib/goenv/libexec/goenv "${pkgdir}/usr/bin/goenv"
    
    echo "$pkgver" > "${pkgdir}/usr/lib/goenv/APP_VERSION"
}

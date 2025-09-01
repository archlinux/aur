pkgname=goenv
pkgver=2.2.28
pkgrel=1
pkgdesc="Like pyenv and rbenv, but for Go."
arch=('any')
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
    
    if [ -d "plugins" ]; then
        install -d "${pkgdir}/usr/lib/goenv/plugins"
        cp -r plugins/* "${pkgdir}/usr/lib/goenv/plugins/"
    fi
    
    install -d "${pkgdir}/usr/bin"
    ln -s /usr/lib/goenv/libexec/goenv "${pkgdir}/usr/bin/goenv"
    
    echo "$pkgver" > "${pkgdir}/usr/lib/goenv/APP_VERSION"
    
    if [ -f "README.md" ]; then
        install -D -m644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    fi
    
    if [ -f "LICENSE" ]; then
        install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}

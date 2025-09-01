pkgname=goenv
pkgver=2.2.28
pkgrel=1
pkgdesc="Like pyenv and rbenv, but for Go."
arch=('any')
url="https://github.com/syndbg/goenv"
license=('MIT')
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
)
md5sums=('163c351001f67d016a4464d94dac16df')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    
    # Instalar libexec
    for file in libexec/*; do
        install -D -m755 "$file" "${pkgdir}/usr/lib/goenv/$file"
    done
    
    # Instalar bin
    for file in bin/*; do
        install -D -m755 "$file" "${pkgdir}/usr/lib/goenv/$file"
    done
    
    # Instalar plugins (incluindo go-build se existir)
    if [ -d "plugins" ]; then
        install -d "${pkgdir}/usr/lib/goenv/plugins"
        cp -r plugins/* "${pkgdir}/usr/lib/goenv/plugins/"
    fi
    
    # Criar link simbólico
    install -d "${pkgdir}/usr/bin"
    ln -s /usr/lib/goenv/libexec/goenv "${pkgdir}/usr/bin/goenv"
    
    # Instalar documentação
    if [ -f "README.md" ]; then
        install -D -m644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    fi
    
    # Instalar licença
    if [ -f "LICENSE" ]; then
        install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
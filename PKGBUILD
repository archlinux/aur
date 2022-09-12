# Maintainer: Xiaotian Wu <yetist@gmail.com>

pkgname=aigepu
pkgver=1.0.0
pkgrel=2
pkgdesc="指北者有声简谱编辑软件"
url="https://aigepu.com"
arch=('x86_64')
license=('GPL')
depends=('electron')
makedepends=('asar')
source=('aigepu.desktop'
        'index.js'
	'aigepu.sh'
        'logo.png'
        'package.json'
)
sha256sums=('4a80f5c56a36f9b57d75f1ad928d3bc1fb9996c6972f0239ca59e0678caee9dc'
            '20e02090f2e037b389cf616414f579180b3f76b47fdf3304eb07d0f211ca19fc'
            '40e0d06777bb050ecc03238e617754a500fedd18fc07e9332d4eff671561983a'
            'b1601305118665652818b2567e098414586a373aac8f1329bb03585674ccab44'
            '9f8df1516e01d76b3377dd7a24593e206bd29a52d3559345e534cefc46fad71b')

build() {
    mkdir -p app
    cp index.js logo.png package.json app
    asar pack app app.asar
}

package() {
    cd "$srcdir"

    # Install executable file
    install -Dm755 "$pkgname".sh "$pkgdir"/usr/bin/$pkgname

    # Install desktop file
    install -Dm644 logo.png ${pkgdir}/usr/share/pixmaps/$pkgname.png
    install -Dm644 $pkgname.desktop -t ${pkgdir}/usr/share/applications/

    install -Dm644 app.asar -t ${pkgdir}/usr/lib/$pkgname/
}

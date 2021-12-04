# Maintainer: Xiaotian Wu <yetist@gmail.com>

pkgname=aigepu
pkgver=1.0.0
pkgrel=1
pkgdesc="指北者有声简谱编辑软件"
url="https://aigepu.com"
arch=('x86_64')
license=('GPL')
depends=('c-ares' 'ffmpeg' 'gtk3' 'http-parser' 'libevent' 'libnghttp2'
         'libxslt' 'minizip' 'nss' 're2' 'snappy')
makedepends=('asar' 'electron11')
source=('aigepu.desktop'
        'index.js'
        'logo.png'
        'package.json'
)
sha256sums=('4a80f5c56a36f9b57d75f1ad928d3bc1fb9996c6972f0239ca59e0678caee9dc'
            '0fcf90ce21d83abf12d013f1fcbcacbe79c6c3a737d677a686210a43ac902d77'
            'b1601305118665652818b2567e098414586a373aac8f1329bb03585674ccab44'
            '9f8df1516e01d76b3377dd7a24593e206bd29a52d3559345e534cefc46fad71b')

build() {
    mkdir app
    cp index.js logo.png package.json app
    cp -rf /usr/lib/electron11/* .
    rm resources/default_app.asar
    asar pack app resources/app.asar
    ln -fsr electron aigepu
}

package() {
    install -d ${pkgdir}/usr/lib/aigepu
    cp -rf locales/ resources/ swiftshader/ ${pkgdir}/usr/lib/aigepu
    cp lib* ${pkgdir}/usr/lib/aigepu
    cp *.pak *.bin *.json ${pkgdir}/usr/lib/aigepu
    cp chrome-sandbox electron version ${pkgdir}/usr/lib/aigepu
    ln -sf electron ${pkgdir}/usr/lib/aigepu/aigepu

    install -d ${pkgdir}/usr/bin
    ln -sf /usr/lib/aigepu/aigepu ${pkgdir}/usr/bin/aigepu

    install -Dm644 logo.png ${pkgdir}/usr/share/pixmaps/aigepu.png
    install -Dm644 aigepu.desktop ${pkgdir}/usr/share/applications/aigepu.desktop
}

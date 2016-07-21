# Maintainer: Nicola Squartini <tensor5@gmail.com>

pkgname=min
pkgver=1.3.1
pkgrel=1
pkgdesc='A smarter, faster web browser'
arch=('any')
url='https://minbrowser.github.io/min'
license=('Apache')
depends=('electron')
makedepends=('nodejs-grunt-cli' 'npm')
source=("https://github.com/minbrowser/min/archive/v${pkgver}.tar.gz"
        'min.sh')
sha256sums=('1f63664518f8535e1472f5d1fdd81d0a8426b752075433e1ecf3a28e43954057'
            '5b7451246eeada602ce0c6bf8635ef8a4918ab76ba652a562c4f8b114f5e3f24')

build() {
    cd ${pkgname}-${pkgver}

    npm install
    grunt
    npm prune --production
}

package() {
    cd ${pkgname}-${pkgver}

    install -d "${pkgdir}"/usr/lib/${pkgname}
    cp -r * "${pkgdir}"/usr/lib/${pkgname}

    install -D -m 755 "${srcdir}"/${pkgname}.sh "${pkgdir}"/usr/bin/${pkgname}
}

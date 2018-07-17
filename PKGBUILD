pkgname=ivideo
pkgver=1.1.1
pkgrel=1
pkgdesc="A client that can watch video of domestic (China) mainstream video platform."
arch=('x86_64')
url="https://github.com/phobal/ivideo"
license=('MIT')
depends=('electron')
makedepends=('npm' 'yarn' 'python2')
provides=('ivideo')

source=("https://codeload.github.com/phobal/ivideo/tar.gz/${pkgver}"
        "https://raw.githubusercontent.com/phobal/ivideo/master/LICENSE")

sha512sums=('4aa0d5e94d5c7b48c2956863bc5374ba825fcc05cba5e2409323a02bf0f68caeeeab9bc0dcd98dc047f454d594c98b5857d8d20357e28f58d9e828b9e92580a6'
            '5372a49a3dfc0219798af0e7f2f5a3507b915ddb6db99ce54f2f7c43a2a538d21c08314b6b13ea2ebfcf304da04a28cf4d7fc031c72b07b3dbaea284f33377a5')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    yarn install
    yarn package-linux
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/release"
    deb_package="electron-react-boilerplate_1.1.0_amd64.deb"
    ar xf "${deb_package}"
    tar xf data.tar.xz -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/ivideo/LICENSE"
}

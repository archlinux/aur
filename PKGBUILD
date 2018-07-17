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
            'bc3a9a02b48c36cd3118296401934fe209589e2bad1fd18213c044344d968dee73e316d616b0d967220cb54a99e5eee65dc8c3ec08ab1d5493d7e97ec67532c3')

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

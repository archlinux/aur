# Maintainer: Zion Nimchuk <zionnimchuk@gmail.com>
pkgname=jgrasp
_version=2.0.6
_version_postfix=17
pkgver=${_version}"_"${_version_postfix}
pkgrel=1
pkgdesc="Lightweight development environment written in Java."
arch=('i686' 'x86_64')
license=('custom')
url="http://jgrasp.org"
options=('!strip')
depends=('java-environment-openjdk>=8')
makedepends=('gcc')
source=(
    "http://www.jgrasp.org/dl4g/jgrasp/jgrasp${_version//./}_${_version_postfix}.zip"
    "jgrasp"
    "jGRASP.desktop"
    "LICENSE"
)
sha512sums=('52cacdc25d63e4770cc95905508ba2954c84400c8cb7ef5f1529ca5ec263ed576eec0576ec8835ef6d25a15d53b02c0956c0a7a6dddc083361e94b0cd2008dcb'
                        '5a5be3fb9a2905a8139531b3d5ea21eb11a7f70ad86581515e39da3f936d9d62158ecdba3203c95a5d115e01fa7d00e04244dcdaa56b289e532bcdefa02fd4a1'
                        'c081c3418f476bec578bb01b95ebbf0b06b3c9290b9d60efc5f4b504fc9e5eba8749724ab5bd4ad5f2a4b417b7adcf6feb92ee938aa50c464c3fdcee7d2159d8'
                        'd7cb5729610ae80879d34c1869b6fff7be9e0742165cdf80c44d8e279e4f9676d423104a666625dd43d31263d359c59005d66522916a982156d81537f03e654f'
                        )

build() {
    cd "${srcdir}/${pkgname}/src"
    ./configure
    ./Make.sh
}

package() {
    cd "${srcdir}"
    install -D -m755 "${srcdir}/../${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -D -m644 "${srcdir}/jGRASP.desktop" "${pkgdir}/usr/share/applications/jGRASP.desktop"
    install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
    
    cd "${srcdir}/${pkgname}"
    
    #Cleanup some uneeded files.
    rm -r ./src
    cd bin
    rm ./*.exe
    rm ./*.bat
    rm -r ./osx
    cd ..
    rm ./internal_bin/*.exe
    rm ./internal_bin/*.dll
    
    #Copy to proper install directory
    cp -R "${srcdir}/${pkgname}/" "${pkgdir}/usr/share/${pkgname}/"
}

# Maintainer: Zion Nimchuk <zionnimchuk@gmail.com>
pkgname=jgrasp
_version=2.0.5
_version_postfix=03
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
sha512sums=('7af5609edd483c4baed5bd3ac2884db74e5e89da9e12f1e62ef7d65c626d08d18e29a2cd0c6d97211ce28f70305ec8a73d6d6b642fbf9c68e09d3787b7b5b8db'
                        '5127e410f5123802310c6ea216b8bb82b8d650bd0540188b6d84a9c42d9f3882ce111f3eebdd73340a2c84d6d50c1ce62f947fcb21bd2154c2ddeecf91779918'
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
    rm -r ./osx104
    cd ..
    rm ./jbin/*.exe
    rm ./jbin/*.dll
    
    #Copy to proper install directory
    cp -R "${srcdir}/${pkgname}/" "${pkgdir}/usr/share/${pkgname}/"
}

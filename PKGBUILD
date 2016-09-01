# Maintainer: Mirko Lelansky <mlelansky@mail.de>
pkgname=lazybones
pkgver=0.8.3
pkgrel=1
pkgdesc='A project directory generator.'
arch=('any')
url='https://bintray.com/pledbrook/lazybones-templates/lazybones'
license=('Apache')
depends=('java-environment' 'bash')
source=(https://bintray.com/pledbrook/lazybones-templates/download_file?file_path=${pkgname}-${pkgver}.zip
        ${pkgname}.sh)
sha512sums=('0cfd187dcca15490b3bf05c3695a2407aa8683d65c05d29f891f17860d90113f1c573bb2bbf0ec07ab09d5338e0beb64eeef19e7c89a7017704998e80c37cc97'
            'b0361937ff0761bea8b2624809be2321a056a533c643f037815ef019be00af2a094e81cc7218b00c2244d8b98506913d452b9a53081696e914bec4ad5395b455')

package() {

    # install profile.d script
    install -Dm 755 "${srcdir}/${pkgname}.sh" "${pkgdir}/etc/profile.d/${pkgname}.sh"

    # create the necessary directory structure
    install -d "${pkgdir}/usr/share/java/${pkgname}/bin"
    install -d "${pkgdir}/usr/share/java/${pkgname}/lib"
    install -d "${pkgdir}/usr/bin"

    # copy across java files
    install -Dm 644 "${srcdir}/${pkgname}-${pkgver}/lib/"*.jar "${pkgdir}/usr/share/java/${pkgname}/lib"

    # copy across supporting scripts
    install -m 755 "${srcdir}/${pkgname}-${pkgver}/bin/${pkgname}" "${pkgdir}/usr/share/java/${pkgname}/bin"

    # link lazybones script to /usr/bin
    ln -s "/usr/share/java/${pkgname}/bin/${pkgname}" "${pkgdir}/usr/bin"
}


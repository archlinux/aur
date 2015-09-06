# Maintainer: Ondřej Hruška <ondra@ondrovo.com>

pkgname=rpw

pkgver=4.3.0
FNAME="RPW-4-3-0.jar"
pkgrel=2

pkgdesc="Minecraft resource pack editor by MightyPork"
arch=('any')
url='http://rpw.ondrovo.com/'
license=('RPW license')


depends=('java-runtime')
source=("https://dl.dropboxusercontent.com/u/64454818/RPW/$FNAME"
        'https://raw.githubusercontent.com/MightyPork/rpw/master/LICENSE.txt')

optdepends=('gimp: Editing textures'
            'audacity: Editing sound files'
            'minecraft: Source of vanilla asset files (.minecraft folder)')

provides=('rpw')

md5sums=('314d5fe7db04ca774d59982d95f23024'
         '34ccc931e00e0e1354d2409159824290')


package() {
    # install license
    install -Dm 644 "${srcdir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # install files in /usr/share
    install -Dm 755 "${srcdir}/${FNAME}" "${pkgdir}/usr/share/${pkgname}/RPW.jar"

    # generate a launcher script
    echo -e "#!/bin/bash\nexec /usr/bin/java -jar '/usr/share/${pkgname}/RPW.jar' \"\$@\"\n" > "${srcdir}/launcher.sh"

    install -Dm 755 "${srcdir}/launcher.sh" "${pkgdir}/usr/bin/rpw"
}

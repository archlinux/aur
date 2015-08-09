# Maintainer: 00x <00x@cock,li>
# Contributor: RunningDroid <rningdrd&tormail,org>
# Contributor: Gianni Vialetto <gianni@rootcube.net> 
# Contributor: Bartlomiej Piotrowski <barthalion@gmail.com>
# Contributor: Thomas Mudrunka <harvie@@email..cz>

pkgname=torchat
pkgver=0.9.9.553
pkgrel=2
pkgdesc="A decentralized instant messenger built on top of the Tor Network"
arch=('any')
license=('GPL')
url="https://github.com/prof7bit/TorChat"
depends=('tor' 'python2' 'wxpython')
source=("https://github.com/downloads/prof7bit/TorChat/${pkgname}-source-${pkgver}.zip"
        "${pkgname}"
        "${pkgname}.desktop")
sha1sums=('cbb55a99ffbc9d92a98373a4f749d23c499eaad8'
         'cfe8417a2386cf78828774c82622d19721828a33'
         '9aae48e906c958d25b167ecd0be04017ce8a56e8')

package() {
    install -m755 -d ${pkgdir}/opt/torchat/
    cp -r ${srcdir}/src/* ${pkgdir}/opt/torchat/

    find ${pkgdir}/opt/torchat/ -iname "*.py" | xargs sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|'
    find ${pkgdir}/opt/torchat/ -iname "*.py" | xargs sed -i 's|#!/usr/bin/python|#!/usr/bin/python2|'
    rm ${pkgdir}/opt/torchat/portable.txt

    install -d ${pkgdir}/usr/bin
    install ${srcdir}/torchat ${pkgdir}/usr/bin

    install -d ${pkgdir}/usr/share/applications
    install ${srcdir}/$pkgname.desktop ${pkgdir}/usr/share/applications/

    install -d ${pkgdir}/usr/share/pixmaps
    install ${srcdir}/src/icons/torchat.png ${pkgdir}/usr/share/pixmaps/
}

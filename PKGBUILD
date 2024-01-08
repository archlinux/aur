# Maintainer: N/A <N/A>
pkgname=pitchbox
pkgver=2.0.2
pkgrel=1.1
pkgdesc="Small software application for transforming your voice or music in real-time."
arch=('any')
url="https://www.pitchtech.ch/PitchBox"
license=('none/unknown')
depends=('java-runtime' 'ca-certificates-java')
makedepends=()
source=('https://www.pitchtech.ch/PitchBox/PitchBox.zip'
        'PitchBox.desktop')
sha256sums=('0e6b5e2f597c96e59f8ed8606d60cf1cdbd1b32052eef74e65731256620ada6f'
            '7e3edf07afb93262055e4f4ee52f762a56314a047b83732f0091d760452aea78')

package() {
    # make pitchbox files structure 
    install -d ${pkgdir}/opt/PitchBox
    install -d ${pkgdir}/usr/bin
    install -d ${pkgdir}/usr/share/applications
    
    # copy pitchbox to pkgdir 
    cp -a ${srcdir}/PitchBox/* ${pkgdir}/opt/PitchBox
    chmod 755 ${pkgdir}/opt/PitchBox/PitchBox.jar
    
    # install desktop file for users
    install -Dm644 ${srcdir}/PitchBox.desktop -t ${pkgdir}/usr/share/applications
    
    # create startup script for terminal and fix permissions
    echo '#!/bin/bash' > ${pkgdir}/usr/bin/${pkgname}
    echo "java -jar /opt/PitchBox/PitchBox.jar" >> ${pkgdir}/usr/bin/${pkgname}
    chmod 755 ${pkgdir}/usr/bin/${pkgname}
}

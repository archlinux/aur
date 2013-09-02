# Maintainer: Slash <demodevil5 [at] yahoo [dot] com>

pkgname=doom3-cdoom
pkgver=1.3.1
pkgrel=2
pkgdesc='Classic Doom: Doom 1 shareware episode maps recreated for use with Doom 3.'
url='http://www.moddb.com/mods/classic-doom-3'
license=('custom')
arch=('any')
depends=('doom3' 'sh')
# Download: http://www.gamefront.com/files/files/9003559/classic_doom_3_1.3.1.zip
source=('http://www.slashbunny.com/aur/doom3-cdoom/classic_doom_3_131.zip' 'doom3-cdoom.desktop' 'doom3-cdoom.launcher')
sha256sums=('e771efcb2178389cfd73d4ba59c4b78ce226d42f82ccba9859f597291bbecad5'
            '62f81a078d70b5474f9b6829d76835ea58b50dc40ee120649d7b19d6d456714e'
            '32ed98f373573906d5f5082ad9a09ae0d65e4ae7c47e42cee8468b95e4ce8171')
PKGEXT='.pkg.tar'

package() {
    cd ${srcdir}

    # Create Destination Directories
    install -d ${pkgdir}/{usr/bin/,opt/doom3/}

    # Remove Unneeded Files
    rm ${srcdir}/cdoom/{*.url,*.bat}

    # Move Icon
    mv ${srcdir}/cdoom/cdoom.ico ${srcdir}/doom3-cdoom.ico

    # Move License
    mv ${srcdir}/cdoom/docs/License.txt ${srcdir}/License.txt

    # Move Data to Destination Directory
    mv ${srcdir}/cdoom ${pkgdir}/opt/doom3/

    # Install Launcher (Client)
    install -D -m 755 ${srcdir}/doom3-cdoom.launcher \
        ${pkgdir}/usr/bin/doom3-cdoom

    # Install License
    install -D -m 644 ${srcdir}/License.txt \
        ${pkgdir}/usr/share/licenses/$pkgname/License.txt

    # Install Icon
    install -D -m 644 ${srcdir}/doom3-cdoom.ico \
        ${pkgdir}/usr/share/pixmaps/doom3-cdoom.ico

    # Install Desktop File
    install -D -m 644 ${srcdir}/doom3-cdoom.desktop \
        ${pkgdir}/usr/share/applications/doom3-cdoom.desktop
}

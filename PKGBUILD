# Maintainer: LeSnake <dev.lesnake@posteo.de>

pkgname=flashpoint-launcher-bin
pkgver=10.0.0
pkgrel=5
pkgdesc="Launcher for BlueMaxima's Flashpoint with script to install data files"
arch=('x86_64')
url="https://github.com/FlashpointProject/launcher"
license=('MIT')
depends=('nss>=3.0'
         'php'
         'gtk3'
         'libxss'
         'wine'
         'wget'
         'p7zip')
optdepends=('flashplayer-standalone: native Flash support')
conflicts=('flashpoint-bin' 'flashpoint-launcher-git')
source=("https://github.com/FlashpointProject/launcher/releases/download/10.0.0/Flashpoint-10.0.0_linux-amd64.deb"
             "flashpoint-install-data-files.sh")
sha256sums=('19ba5cd803fd05d944df616719eb0e22051d3cc051e8817f4a057d02bf139bfc'
                      '3591c14565552897c1028ddc513dfbe0a306b96f571d41509886f83a7bd92cc9')
md5sums=('8e998d8d9c77027a67b30ddd3250ffc5'
                  '775dd2b78c17a73edb75040fc86ebfe6')
install=flashpoint-launcher-bin.install

package(){

    # Extract package data
    tar xf data.tar.xz -C ${pkgdir}

    # Symlink to binary
    install -d $pkgdir/usr/bin/
    ln -sf /opt/Flashpoint/flashpoint-launcher $pkgdir/usr/bin/flashpoint-launcher

    # License
    install -d $pkgdir/usr/share/licenses/
    mv $pkgdir/opt/Flashpoint/licenses/ $pkgdir/usr/share/licenses/Flashpoint

    install -Dm755 $srcdir/flashpoint-install-data-files.sh $pkgdir/usr/bin/flashpoint-install-data-files

    # Make config and preferences writable by all
    touch "${pkgdir}/opt/Flashpoint/config.json"
    chmod 666 "${pkgdir}/opt/Flashpoint/config.json"
    touch "${pkgdir}/opt/Flashpoint/preferences.json"
    chmod 666 "${pkgdir}/opt/Flashpoint/preferences.json"
    touch "${pkgdir}/opt/Flashpoint/launcher.log"
    chmod 666 "${pkgdir}/opt/Flashpoint/launcher.log"
}

# Contributor: Jozef Riha <jose1711 at gmail dot com>
# Updated by Manuel Conzelmann, changed to non-branded software
# Updated by Zoe <chp321 at gmail dot com>, for french version
# Maintainer: zoe <chp321@gmail.com>

pkgname=cewe-monlivrephoto
pkgver=5.1.8
pkgrel=1
pkgdesc="Création off-line de livres photos, commandables ensuite en ligne auprès de divers partenaires commerciaux - Version française"
url="http://www.livrephoto-cewe.fr/"
license=("custom:eula")
depends=('libx11' 'libjpeg' 'curl' 'wget')
conflicts=('cewe-fotobuch')
arch=('i686' 'x86_64')
source=("http://dls.photoprintit.com/api/getClient/14227/hps/om_sem_goo_brand_14227_x/linux/setup_Mon_LIVRE_PHOTO_CEWE.tgz"         
"cewe-monlivrephoto.desktop" "cewe-monlivrephoto.install")
install=cewe-monlivrephoto.install
md5sums=('89f5753d18042405c604c766893d20fd' 'a6b82116c19dcca0b5d8ac74707d8938' '82baecba5be4c2af0cccf0f5bc0e00c7')

package() {
        cd $srcdir
        mkdir -p $pkgdir/usr/{share/$pkgname,bin}
        ./install.pl --installDir=$pkgdir/usr/share/cewe-monlivrephoto --workingDir=$srcdir -k -v
        # create startup script
        (echo "#!/bin/bash
cd /usr/share/$pkgname
./cewe-monlivrephoto \"\$@\"") > $pkgdir/usr/bin/cewe-monlivrephoto
        chmod 755 $pkgdir/usr/bin/cewe-monlivrephoto
        # utf-8 and space in executable filenames is generally a bad idea
        cd $pkgdir/usr/share/$pkgname
        mv "Mon LIVRE PHOTO CEWE" "cewe-monlivrephoto"
        # create desktop shortcut
        install -D -m644 $pkgdir/usr/share/$pkgname/Resources/keyaccount/32.xpm $pkgdir/usr/share/pixmaps/cewe-monlivrephoto.xpm && \
        install -D -m644 $srcdir/cewe-monlivrephoto.desktop $pkgdir/usr/share/applications/cewe-monlivrephoto.desktop || return 1
}

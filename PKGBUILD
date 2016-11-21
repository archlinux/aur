# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: jhrdka
# Contributor: James An <james@jamesan.ca>
# Contributor: ugaciaka <ugaciaka@gmail.com>

_realname=SimpleLabeler
_pkgpath=opt/lightscribeApplications
_pkgname=lightscribe-labeler

pkgname=bin32-lightscribe-labeler
pkgver=1.18.15.1
pkgrel=6
pkgdesc="LightScribe Simple Labeler"
arch=('x86_64')
url="http://www.pawtec.com/lightscribe"
license=('custom')
depends=('bin32-lightscribe' 'lib32-qt4' 'lib32-libxi' 'lib32-libxcursor' 'lib32-libpng12' 'lib32-fontconfig' 'lib32-libsm' 'lib32-libxrandr')
provides=("$_pkgname=$pkgver")
conflicts=($_pkgname)
options=('!strip')
source=(http://www.pawtec.com/lightscribe_files/Linux/LSL/lightscribeApplications-$pkgver-linux-2.6-intel.rpm lightscribe-labeler.desktop SimpleLabeler)
md5sums=('bf5eb9aa41e3b5f4d0c879591464c1db'
         '02f2e57ec1773d906f8b15e6f1f95eae'
         'ea6b5b9c1d18161fe2c6cae21b305016')

build() {
  cd $srcdir/$_pkgpath
  chmod -x $_realname/qt.conf
}

package() {
    cd $srcdir

    msg2 "  -> Installing program..."
    install -d $pkgdir/$_pkgpath/$_realname
    cp -r $_pkgpath/SimpleLabeler $pkgdir/$_pkgpath/

    msg2 "  -> Installing icon..."
    install -Dm644 $_pkgpath/$_realname/content/images/LabelWizardIcon.png ${pkgdir}/usr/share/pixmaps/$_pkgname.png

    msg2 "  -> Installing shortcut and symlink..."
    install -Dm644 $_pkgname.desktop $pkgdir/usr/share/applications/$_pkgname
    install -d $pkgdir/usr/bin
    ln -s /$_pkgpath/$_realname/$_realname $pkgdir/usr/bin/$_pkgname
    
    msg2 "  -> Installing license           ..."
    install -Dm644 $_pkgpath/lightscribeLicense.rtf $pkgdir/usr/share/licenses/$_pkgname/license.rtf
    install -Dm755 $srcdir/SimpleLabeler $pkgdir/usr/bin/lightscribe-labeler
}

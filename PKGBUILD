# Maintainer: M0Rf30 <morf3089@gmail.com>

pkgname=sacks
pkgver=12.67f6745
pkgrel=1
pkgdesc="An integrated system to allow Digital Gathering (Adunanza Digitale).Adunanza Digitale is an assembly available on-line." 
arch=('i686' 'x86_64') 
url="http://adunanzadigitale.org" 
depends=('libvncserver' 'python2' 'python2-pyqt4' 'vlc' 'python-dnspython' 'openssl' 'python2-pjproject' 'pyvnc' 'xmpppy') 
makedepends=('git')
license=('GPL3') 
source=("sacks::git://github.com/M0Rf30/sacks.git"
	sacks-bin
        sacks.desktop 
        )

package() {
    cd sacks
    msg 'Arrange sacks folders...'
    mkdir -p $pkgdir/usr/share/sacks
    cp -r * $pkgdir/usr/share/sacks
    mkdir -p $pkgdir/usr/share/applications/
    cp $srcdir/sacks.desktop $pkgdir/usr/share/applications
    mkdir -p $pkgdir/usr/share/icons/hicolor/32x32/apps/   
    mv $pkgdir/usr/share/sacks/sacksIcon.png $pkgdir/usr/share/icons/hicolor/32x32/apps/sacks.png
    mkdir -p $pkgdir/usr/share/licenses/sacks/
    mv $pkgdir/usr/share/sacks/COPYING $pkgdir/usr/share/licenses/sacks/
    ln $pkgdir/usr/share/licenses/sacks/COPYING   $pkgdir/usr/share/sacks/
    msg 'Create execution script...'  
    mkdir -p $pkgdir/usr/bin
    cp $srcdir/sacks-bin $pkgdir/usr/bin/sacks
    msg 'Create Bytecode...'
    cd $pkgdir/usr/share/sacks && python2 -m compileall .
}

pkgver() {
  cd sacks
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

md5sums=('SKIP'
         '4041f5db9c0dd29c8ebbbe6327d4e4c5'
         '65b46bae1c502b0cc8e72bc283a2fcc0')

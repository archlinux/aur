# Maintainer: Benjamin Bukowski <benjamin.bukowski<at>gmail.com>
_realname="DirSync Pro"
_pkgname=DirSyncPro
pkgname=dirsyncpro
pkgver=1.51
pkgrel=1
pkgdesc="A small but powerfull utility for file and folder synchronisation"
arch=('i686' 'x86_64')
url="http://www.dirsyncpro.org/"
license=('GPL')
depends=('java-runtime')
backup=()
source=("http://downloads.sourceforge.net/project/directorysync/DirSync%20Pro%20%28stable%29/${pkgver}/${_pkgname}-${pkgver}-Linux.tar.gz"
				"dirsyncpro-home-wd.patch")

build() {
  cd "$srcdir/$_pkgname-$pkgver-Linux"
   
  msg "Apply some patches..."
  patch -Np1 -i ../dirsyncpro-home-wd.patch
}

package() {
	cd "$srcdir/$_pkgname-$pkgver-Linux"

  install -dm755 $pkgdir/opt/$pkgname/ \
                 $pkgdir/usr/bin/ || return 1

  install -m644 ./* $pkgdir/opt/$pkgname/ || return 1  
  
  chmod +x $pkgdir/opt/$pkgname/$pkgname.sh

  ln -s /opt/$pkgname/$pkgname.sh $pkgdir/usr/bin/$pkgname
}

md5sums=('deaaf7ea8a51dff3dbaa25a1558e6b88'
         '08ad637c654d21fb52a86d252ac89865')

# Maintainer: M0Rf30

pkgname=stackedit
pkgver=4.3.11
pkgrel=1
pkgdesc='In-browser markdown editor'
arch=('any')
url='https://stackedit.io/'
license=('APACHE')
depends=('nodejs' 'nodejs-gulp' 'nodejs-bower' 'chromium')
options=(!strip)
source=("https://github.com/benweet/$pkgname/archive/v${pkgver}.tar.gz"
	$pkgname.sh
	$pkgname.desktop
	$pkgname.service)
	
install=$pkgname.install
pkgext='.pkg.tar'

build(){
  cd $pkgname-$pkgver
  npm install
  bower install
  gulp
}

package() {
  cd $pkgname-$pkgver
  #Create folder for user $pkgname
  install -dm755 $pkgdir/var/lib/$pkgname
  cp -r * $pkgdir/var/lib/$pkgname/
  
  install -vDm755 $srcdir/$pkgname.sh $pkgdir/usr/bin/$pkgname
  install -vDm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -vDm644 chrome-app/logo-128.png $pkgdir/usr/share/pixmaps/$pkgname.png
  
  #Create systemd service
  install -Dm644 $srcdir/$pkgname.service $pkgdir/usr/lib/systemd/system/$pkgname.service
}

md5sums=('e429d3430eae9e25d82b1f21ac0143dc'
         'fa3e94acf51ce70ddae6f80f9704c9ef'
         '6453098c6abf5c3fdc6e7d455a4e927b'
         '7d2e961d8f66b25830f7e43b51155a82')

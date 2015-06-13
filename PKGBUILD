# Maintainer: Xavier Corredor <xavier.corredor.llano (a) gmail.com>

pkgname=yadsync
pkgver=1.0
pkgrel=2
pkgdesc="YADSync (yet another directories sync, PyKDE/PyGTK GUI for rsync) is a simple tool to easy synchronize a set of directories."
url="http://yadsync.le-web.org"
license=('GPL')
arch=('i686' 'x86_64')
if [ `which gnome-session` ]; then
	depends=('rsync' 'python2' 'pygtk')
	_de=gnome
elif [ `which kdeinit4` ]; then
	depends=('rsync' 'python2') 
	_de=kde4
else
	return 1
fi
source=(http://yadsync.le-web.org/download/yadsync/yadsync-${pkgver}_src.tar.gz)
md5sums=('39d20bf058c17aaa7545d12e41f840a5')

build() {
  cd $startdir/src/$pkgname-$pkgver/common
  ./configure --prefix=/usr  || return 1
  make  || return 1
  #fix version python
  sed -i 's|python|python2|g' yadsync
  make DESTDIR=${pkgdir} install  || return 1
	  
  cd $startdir/src/$pkgname-$pkgver/$_de
  ./configure --prefix=/usr  || return 1
  make  || return 1
  #fix version python
  sed -i 's|python|python2|g' yadsync-${_de}
  make DESTDIR=${pkgdir} install

}

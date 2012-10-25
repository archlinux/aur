# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=flyspray
pkgver=0.9.9.7
pkgrel=1
pkgdesc="A PHP web-based bug tracker"
arch=('any')
url="http://www.flyspray.org/"
license=('GPL')
depends=('php')
makedepends=('unzip')
backup=('etc/webapps/flyspray/.htaccess')
options=('!strip')
noextract=(flyspray-$pkgver.zip)
source=(http://flyspray.org/flyspray-$pkgver.zip
	"flyspray-php-5.4.patch::https://projects.archlinux.org/vhosts/bugs.archlinux.org.git/patch/?id=aaeeeb05f6d81ce88131239126b9da189fd1f904")
md5sums=('3a218c5447d64af18f19bc63bb825e58'
         '1e5fdc4d2ae316e840960afd39d36061')

build() {
  mkdir $srcdir/flyspray-${pkgver}
  (cd $srcdir/flyspray-${pkgver} && \
	unzip ../flyspray-$pkgver.zip)

  _instdir=$pkgdir/usr/share/webapps/flyspray
  mkdir -p ${_instdir} $pkgdir/etc/webapps/flyspray
  cd ${_instdir}
  cp -ra $srcdir/flyspray-${pkgver}/* .
  echo "deny from all" > $pkgdir/etc/webapps/flyspray/.htaccess
  ln -s /etc/webapps/flyspray/.htaccess .htaccess
}

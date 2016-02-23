# Maintainer: James An <james@jamesan.ca>

_pkgname=timezonedb
pkgname="pecl-$_pkgname"
pkgver=2016.1
pkgrel=1
pkgdesc="Timezone Database to be used with PHP's date and time functions"
arch=('i686' 'x86_64')
url="http://pecl.php.net/package/$_pkgname"
license=('PHP')
depends=('php-pear')
makedepends=('autoconf')
install=$pkgname.install
source=(http://pecl.php.net/get/$_pkgname-$pkgver.tgz)
#~ noextract=("$_pkgname-$pkgver.tgz")
md5sums=('40c4f1b465a5f899db97c06380b15a01')

prepare() {
  cd $_pkgname-$pkgver
  phpize --clean
  phpize
}

build() {
  cd $_pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

check() {
  cd $_pkgname-$pkgver
  make test
}

package() {
  cd $_pkgname-$pkgver
  make INSTALL_ROOT=$pkgdir install
  install -Dm644 ../package.xml "$pkgdir/usr/share/pear/.pkgxml/$_pkgname.xml"
  install -d "$pkgdir/etc/php/conf.d"
  echo ";extension=$_pkgname.so" > "$pkgdir/etc/php/conf.d/$_pkgname.ini"
}

#~ prepare() {
  #~ local _temp_dir=$(pecl config-get temp_dir)
  #~ mkdir -p $(dirname $_temp_dir)
  #~ mkdir -p $pkgdir$_temp_dir
  #~ ln -sf $pkgdir$_temp_dir $_temp_dir
  #~ pecl bundle --destination=$_temp_dir "$_pkgname-$pkgver.tgz"
#~ }

#~ package() {
  #~ pecl install --packagingroot=$pkgdir package.xml
  #~ pecl install --offline --packagingroot=$pkgdir "$_pkgname-$pkgver.tgz"
  #~ make INSTALL_ROOT=$pkgdir install
  #~ install -d "$pkgdir/etc/php/conf.d"
  #~ echo ";extension=$_pkgname.so" > "$pkgdir/etc/php/conf.d/$_pkgname.ini"
#~ }

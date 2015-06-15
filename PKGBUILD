# Maintainer: James An <james@jamesan.ca>

_pkgname=timezonedb
pkgname="pecl-$_pkgname"
pkgver=2015.4
pkgrel=2
pkgdesc="Timezone Database to be used with PHP's date and time functions"
arch=('i686' 'x86_64')
url="http://pecl.php.net/package/$_pkgname"
license=('PHP')
depends=('php-pear')
makedepends=('autoconf')
#~ install=$pkgname.install
source=(http://pecl.php.net/get/$_pkgname-$pkgver.tgz)
#~ noextract=("$_pkgname-$pkgver.tgz")
md5sums=('965459fee5cb73f81cbcda57c9da1ca6')

prepare() {
  cd $_pkgname-$pkgver
  phpize --clean
}

build() {
  cd $_pkgname-$pkgver
  phpize
  ./configure
  make
}

package() {
  cd $_pkgname-$pkgver
  make INSTALL_ROOT=$pkgdir install
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

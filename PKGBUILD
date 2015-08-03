# Maintainer: Will Price <will.price94+aur@gmail.com>
pkgname=xtimecomposer
pkgver=13.2.0
pkgrel=3
pkgdesc="Eclipse based IDE for the xCORE microcontrollers"
arch=('x86_64' 'i686')
url="https://www.xmos.com/products/tools/xtimecomposer"
license=('Custom')
provides=('xtimecomposer')
options=(!strip staticlibs)
depends=(java-runtime)
source=('xtimecomposer.patch'
        'xtimecomposer')
md5sums=('f6b95cdf13917852a11e58d60153059d'
         '7883a9fe1f797babbbb85864709bfefa')
_package="xTIMEcomposer-Community_${pkgver%%.*}-Linux64-Installer(Community_$pkgver).tgz"

prepare() {
  echo $_package
 if [[ ! -f "$_package" ]]; then
   echo 'You must download xTIMEcomposer and put
it into the `src` folder' && exit 1
  fi
  tar -xvf "$srcdir/$_package"
  cd "$srcdir/XMOS/xTIMEcomposer/Community_$pkgver/bin"
  patch < "$srcdir/xtimecomposer.patch"
}

package() {
	cd "$srcdir/XMOS/"
	mkdir -p "$pkgdir"/usr/{share,bin}
  cp -r xTIMEcomposer "$pkgdir/usr/share"
  cd "$pkgdir/usr/bin"
  install -m 755 "$srcdir/xtimecomposer" .
}

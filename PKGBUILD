# Maintainer: <giovannisantini93@yahoo.it>
# Contributor: Jochen Schalanda <jochen+aur@schalanda.name>
# Contributor: Charles Pigott <charlespigott@googlemail.com>
# Contributor: André Klitzing <aklitzing@online.de>
# Contributor: JD Horelick <jdhore1@gmail.com>

pkgname=devscripts
pkgver=2.15.4
pkgrel=1
pkgdesc="Scripts to make the life of a Debian Package maintainer easier"
arch=('any')
url="http://packages.qa.debian.org/d/devscripts.html"
license=('GPL2')
depends=('dpkg' 'wget' 'sed' 'perl' 'debianutils' 'debhelper')
optdepends=('sensible-utils: for sensible alternative selection')
makedepends=('po4a' 'perl-timedate' 'perl-libwww' 'docbook-xsl' 'perl-file-desktopentry' 'perl-file-basedir' 'perl-parse-debcontrol' 'python-setuptools')
options=('!makeflags')
source=(http://ftp.debian.org/debian/pool/main/d/${pkgname}/${pkgname}_${pkgver}.tar.xz fixes.patch devscripts.install)
install='devscripts.install'
md5sums=('940e520d057b68fa565f15f057e73d52'
         '8a1a9315dabe0403c92938680319eae6'
         '5ca9e31b6cbe4f32115dedd3a2c2d5b0')

build() {
  cd $srcdir/$pkgname-$pkgver
  patch -p0 -i ../fixes.patch
  make
}

package() {
  mkdir -p $pkgdir/etc/bash_completion.d
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/lib/devscripts
  mkdir -p $pkgdir/usr/share/devscripts


  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}

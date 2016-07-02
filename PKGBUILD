# Maintainer: Giovanni 'ItachiSan' Santini <giovannisantini93@yahoo.it>
# Contributor: Jochen Schalanda <jochen+aur@schalanda.name>
# Contributor: Charles Pigott <charlespigott@googlemail.com>
# Contributor: André Klitzing <aklitzing@online.de>
# Contributor: JD Horelick <jdhore1@gmail.com>

pkgname=devscripts
pkgver=2.16.5
pkgrel=1
pkgdesc="Scripts to make the life of a Debian Package maintainer easier"
arch=('any')
url="http://packages.qa.debian.org/d/devscripts.html"
license=('GPL2')
depends=('dpkg' 'wget' 'sed' 'perl' 'debianutils' 'debhelper' 'perl-timedate')
optdepends=('sensible-utils: for sensible alternative selection')
makedepends=('po4a' 'perl-timedate' 'perl-libwww' 'docbook-xsl' 'perl-file-desktopentry' 'perl-file-basedir' 'perl-parse-debcontrol' 'python-setuptools')
options=('!makeflags')
source=(http://ftp.debian.org/debian/pool/main/d/${pkgname}/${pkgname}_${pkgver}.tar.xz fixes.patch)
install='devscripts.install'
md5sums=('a46ead9163102b60d27de67ce62dc4c1'
         '110857b0eb4a9dbf57a8b562d992ab33')

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

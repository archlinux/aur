# Maintainer: Giovanni 'ItachiSan' Santini <giovannisantini93@yahoo.it>
# Contributor: Jochen Schalanda <jochen+aur@schalanda.name>
# Contributor: Charles Pigott <charlespigott@googlemail.com>
# Contributor: André Klitzing <aklitzing@online.de>
# Contributor: JD Horelick <jdhore1@gmail.com>

pkgname=devscripts
pkgver=2.16.8
pkgrel=1
pkgdesc="Scripts to make the life of a Debian Package maintainer easier"
arch=('any')
url="http://packages.qa.debian.org/d/devscripts.html"
license=('GPL2')
depends=('dpkg' 'wget' 'sed' 'perl' 'debianutils' 'debhelper' 'perl-timedate')
optdepends=('sensible-utils: for sensible alternative selection')
makedepends=('git' 'po4a' 'perl-timedate' 'perl-libwww' 'docbook-xsl' 'perl-file-desktopentry' 'perl-file-basedir' 'perl-parse-debcontrol' 'python-setuptools' 'bash-completion')
options=('!makeflags')
source=(
	#http://ftp.debian.org/debian/pool/main/d/${pkgname}/${pkgname}_${pkgver}.tar.xz
	${pkgname}-${pkgver}::git+https://anonscm.debian.org/git/collab-maint/devscripts.git
	fixes.patch
)
install='devscripts.install'
md5sums=('SKIP'
         '110857b0eb4a9dbf57a8b562d992ab33')

build() {
  cd "$pkgname-$pkgver"
  patch -p0 -i "$srcdir/fixes.patch"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install

  # bts completion is present already in the official package
  rm "$pkgdir/usr/share/bash-completion/completions/bts"
}

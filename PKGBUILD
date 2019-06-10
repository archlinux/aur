# Maintainer:  <fr@nz>
pkgname=phoneinfoga
_reponame=PhoneInfoga
pkgver=v1.6.7.r23.g7fa5127
pkgrel=1
#epoch=
pkgdesc="Advanced information gathering & OSINT tool for phone numbers."
arch=('any')
url="https://github.com/sundowndev/PhoneInfoga/wiki"
license=('GPL')
#groups=()
depends=('python3'
	 'python-requests'
	 'python-beautifulsoup4'
	 'python-html5lib'
	 'python-phonenumbers'
	 'python-urllib3'
	 'python-colorama')
#makedepends=()
#checkdepends=()
#optdepends=()
#provides=()
#conflicts=()
#replaces=()
#backup=()
#options=()
#install=
#changelog=
source=("git+https://github.com/sundowndev/PhoneInfoga")
md5sums=('SKIP')
#noextract=()

pkgver() {
  cd "$srcdir/$_reponame"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

#prepare() {
#  cd "$srcdir/$pkgname-$pkgver"
#
#  patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
#}

#build() {
#  cd "$srcdir/$pkgname"
#
#  ./configure --prefix=/usr
#  make
#}

#check() {
#  cd "$srcdir/$pkgname-$pkgver"
#
#  make -k check
#}

package() {
  cd "$srcdir/$_reponame"

  install -Dt "$pkgdir"/usr/share/"$pkgname" phoneinfoga.py
  install -Dt "$pkgdir"/usr/share/"$pkgname"/lib "$srcdir/$_reponame"/lib/*
  install -Dt "$pkgdir"/usr/share/"$pkgname"/scanners "$srcdir/$_reponame"/scanners/*
  install -D config.example.py "$pkgdir"/usr/share/"$pkgname"/config.py

  printf "#!/bin/sh\npython3 '/usr/share/$pkgname/phoneinfoga.py'" > "$srcdir/$_reponame"/phoneinfoga
  install -Dm755 "$srcdir/$_reponame"/phoneinfoga "$pkgdir"/usr/bin/phoneinfoga

  
  install -Dt "$pkgdir"/usr/share/licenses/"$pkgname" LICENSE
}

# vim:set ts=2 sw=2 et:

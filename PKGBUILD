#Maintainer: aksr <aksr at t-com dot me>
pkgname=smtp-git
pkgver=0.r19.e7d79c1
pkgrel=1
epoch=
pkgdesc="A simple smtp mail sender."
arch=('i686' 'x86_64')
url="http://litcave.rudi.ir/"
url="http://repo.or.cz/w/smtp.git"
license=('custom:BSD')
groups=()
depends=('polarssl')
makedepends=('git')
optdepends=()
checkdepends=()
provides=()
conflicts=('smtp')
replaces=()
backup=()
options=()
changelog=
install=smtp-git.install
source=("$pkgname::git://repo.or.cz/smtp.git")
noextract=()
md5sums=('SKIP')
sha1sums=('SKIP')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
  ## Change to match your settings:
  ##           FROM               SERVER               PORT   USER  PASS /
  sed -i '14s/"me@myserver.sth", "smtp.myserver.sth", "465", "me", "pass"/"FROM", "SERVER", "PORT", "USER", "PASS"/' config.h
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 smtp $pkgdir/usr/bin/smtp
}


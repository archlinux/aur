## Original CTorrent 
## Maintainer: damir 
## Contributor: lanrat 
## 
## Enhanced CTorrent 
## Modified by: lydgate 
## Mod to dnh3 by durbatuluk 
#
## Debian Patches
## https://sources.debian.org/patches/ctorrent/1.3.4.dnh3.3.2-5/

# Maintainer: aksr <aksr at t-com dot me>
_pkgname=ctorrent
pkgname=enhanced-ctorrent
pkgver=dnh3.3.2
pkgrel=2
epoch=
pkgdesc="A BitTorrent client implemented in C++, with bugfixes and performance enhancements."
arch=('i686' 'x86_64')
url="http://www.rahul.net/dholmes/ctorrent/"
license=('GPL')
groups=()
depends=('openssl')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=('ctorrent-dnh')
replaces=('ctorrent')
backup=()
options=()
install=
changelog=
source=("http://www.rahul.net/dholmes/ctorrent/$_pkgname-$pkgver.tar.gz"
        "FTBFS-fix.diff"
        "cve-security-fix.diff") 
noextract=()
sha256sums=('c87366c91475931f75b924119580abd06a7b3cb3f00fef47346552cab1e24863'
            '82099c238bf5bfa2201aa68369ad73b47c4f1b9cd10ac2d927f164eb12f3dde9'
            '566c98b47ee3eebb6aaf79d850a8849fc7331c9995580cd5b9f1cf1bdc4f5de7')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  patch -Np1 < "$srcdir/FTBFS-fix.diff"
  patch -Np1 < "$srcdir/cve-security-fix.diff"
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm644 UserGuide $pkgdir/usr/share/doc/$_pkgname/UserGuide
  install -Dm644 ChangeLog $pkgdir/usr/share/doc/$_pkgname/ChangeLog
  install -Dm644 README-DNH.TXT $pkgdir/usr/share/doc/$_pkgname/README-DNH.TXT
}


# Maintainer: Mike Pento <mjpento@gmail.com>
# Contributor: Christian Neukirchen <chneukirchen@gmail.com>
# Contributor: Jeremy Cowgar <jeremy@cowgar.com>

_patches=(
    'font-settings-fix.patch'
    'format-overflow.patch'
    'implicit-exit.patch'
    'implicit-int-warnings.patch'
    'sound-paths.patch'
    'time-types-fix.patch'
)

pkgname=dclock
pkgver=2.2.2
pkgrel=6
pkgdesc="Digital clock for X"
url="http://opencircuitdesign.com/~tim/programs/"
license=('GPL-1.0-or-later')
depends=('libxft' 'libxt' 'libxext')
makedepends=('imake')
options+=('!debug')
source=(http://ftp.de.debian.org/debian/pool/main/d/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz patches.tgz)
md5sums=('2e9cd689201a62d4a15daf93e45a4e3b'
    'd43b9b160fdcd9bf92648b0e0ab7daad')
arch=('i686' 'x86_64')

prepare() {
    cd $srcdir/$pkgname-$pkgver

    for _patch in ${_patches[@]}; do
        patch --verbose -Np1 -i ../patches/${_patch}
    done
}

build() {
  cd $srcdir/$pkgname-$pkgver
  xmkmf
  make CFLAGS+=-std=gnu17
}

package() {
  cd $srcdir/$pkgname-$pkgver
  install -D -m 755 dclock $pkgdir/usr/bin/dclock
  install -D -m 644 dclock.1 $pkgdir/usr/share/man/man1/dclock.1
}

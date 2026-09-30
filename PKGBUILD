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
pkgrel=7
pkgdesc="Digital clock for X"
url="https://opencircuitdesign.com/~tim/programs/dclock/index.html"
license=('GPL-1.0-or-later')
depends=('libxft' 'libxt' 'libxext' 'libsm' 'libice' 'glibc' 'libx11')
makedepends=('imake')
options+=('!debug')
source=(https://opencircuitdesign.com/~tim/programs/dclock/archive/${pkgname}-${pkgver}.tgz patches.tgz)
md5sums=('53dd6f204a96f9b9ef6b8919a160c181'
    'd43b9b160fdcd9bf92648b0e0ab7daad')
arch=('i686' 'x86_64')

prepare() {
    cd $srcdir/$pkgname

    for _patch in ${_patches[@]}; do
        patch --verbose -Np1 -i ../patches/${_patch}
    done
}

build() {
  cd $srcdir/$pkgname
  xmkmf
  make CFLAGS+=-std=gnu17
}

package() {
  cd $srcdir/$pkgname
  install -D -m 755 dclock $pkgdir/usr/bin/dclock
  install -D -m 644 dclock.1 $pkgdir/usr/share/man/man1/dclock.1
}

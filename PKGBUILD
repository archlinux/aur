# Maintainer: Félix Saparelli <aur@passcod.name>
# Contributor: Eric Forgeot <http://ifiction.free.fr>
pkgname=glfrontier
pkgver=20060623
pkgrel=5
pkgdesc="A reverse-engineered version of Frontier Elite 2 to allow OpenGL rendering."
arch=('i686' 'x86_64')
url="http://tom.noflag.org.uk/glfrontier.html"
license=('unknown')
depends=('sdl' 'mesa' 'libvorbis')
source=('http://tom.noflag.org.uk/glfrontier/frontvm3-20060623.tar.bz2'
        'http://tom.noflag.org.uk/misc/frontvm-audio-20060222.tar.bz2'
        'glfrontier.desktop'
        'glfrontier'
        'Makefile-C.patch')
sha512sums=('45c4b5aaf4f7e2caac632c6af8936992684b048df87c183387283fbb627966e077ac4a50d5e4df0072f025e755a82e43bb9684cb81d1ac4080fc0042d2a36159'
            '50fdd3e7ac5547a0ca2081ab0350a8b7f5ecbeed015d2f3b1947777921fd145cc4475e5fc36910898577d1c9c3fec87d11e0e18240c03490991441c2bd484f6a'
            'f3a703684d06ae1e936c5e86b2105266f0ce26fc605d433e653c6376b1dd24bee6d08489867aec1b3a3e28e7e3c9653299bd42ba724086c89139165550e0806c'
            '3916deb63352d14b4f3ff020892ce66ad0a4fdd2f232302c1d381b1e8c08537ef21494a977ec91e71097aaa0d19aaef5c0cfb957e78430eee4a11e557c2b6dcc'
            '90820bef6936037721d7e47c8b5b7ffc3712121340059b109588f523f2a3ba554b5a6efec9cb8ae4a9bfde2852de35aaf7ed992af062192c3a311bf8d92717c5')

build() {
  cd $srcdir/frontvm3-$pkgver
  patch Makefile-C ../Makefile-C.patch
  make -f Makefile-C || return 1
}

package() {
  cd $srcdir
  mkdir -p $pkgdir/usr/share/$pkgname/savs
  chmod 777 $pkgdir/usr/share/$pkgname/savs

  install -Dm644 {frontvm3-$pkgver,$pkgdir/usr/share/$pkgname}/README
  install -Dm644 {frontvm3-$pkgver,$pkgdir/usr/share/$pkgname}/fe2.s.bin
  install -Dm755 {frontvm3-$pkgver,$pkgdir/usr/share/$pkgname}/frontier
  install -Dm644 {,$pkgdir/usr/share/applications/}${pkgname}.desktop
  install -Dm755 {,$pkgdir/usr/bin/}$pkgname

  cp -dr --no-preserve=ownership frontvm-audio-20060222/{music,sfx} $pkgdir/usr/share/$pkgname/
}

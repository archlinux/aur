# Maintainer: Peter blackman <peter at pblackman dot plus dot com>
# Version (1.8) is based on the xbrz library
# xbrzscale does not currently have any version or release tags to use
# Pinned to xbrz 1.8 via the git commit
# Patch makefile to fix RELRO

pkgname=xbrzscale
pkgver=1.8
pkgrel=2
pkgdesc="New Generation Image Upscaling Tool"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/atheros/xbrzscale"
license=('GPL3')
depends=('sdl2_image')
_commit=ef36908831c058df7a202c8175d575a1fdfaf156
source=("$pkgname.zip::https://github.com/atheros/xbrzscale/archive/$_commit.zip"
	001-makefile.patch)
sha256sums=('5b418a271d79f5e7b7add2cc487785c05dbbfd8342e3c18ed7c0a4f70e121bfa'
            '3c6fabff0ce6b6f988aaec4dcc0a350d10c11753fed8729936dab2fc87fbb051')
noextract=($pkgname.zip)


prepare() {
  bsdtar -xf $pkgname.zip -s /$pkgname-$_commit/$pkgname/

  cd "$pkgname"
  patch -Np1 < "$srcdir/001-makefile.patch"
}

build() {
  cd "$pkgname"
  make all
}

package() {
  cd "$pkgname"
  install -Dm 755 "$pkgname"         -t "$pkgdir/usr/bin"
  install -Dm 644 xbrz/Changelog.txt -t "$pkgdir/usr/share/doc/$pkgname"
}

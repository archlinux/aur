# Maintainer: Andrew Stubbs <andrew.stubbs@gmail.com>
_npmname=thumbsup
_npmver=2.3.1
pkgname=nodejs-thumbsup # All lowercase
pkgver=${_npmver//-/}
pkgrel=1
pkgdesc="Photo / video gallery generator"
arch=(any)
url="https://github.com/thumbsup/thumbsup#readme"
license=()
depends=('nodejs' 'npm' 'perl-image-exiftool' 'graphicsmagick')
optdepends=('ffmpeg: for video support')
makedepends=('git' 'python' 'python2'
             # Temporary fix until sql builds with gcc 8
             'gcc6')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=('9487af07c6e177900fe6a91c1594e40e1db4d2d8')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm update

    # Temporary fix until sql builds with gcc 8
    export CC=gcc-6 CXX=g++-6

  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:

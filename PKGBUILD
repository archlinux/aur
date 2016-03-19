# Maintainer: fuxter <fuxterz@gmail.com>

_name=linapple
pkgname="${_name}-git"
pkgver=2015.06.29.g956f676
pkgrel=1
pkgdesc="Apple 2e emulator"
arch=('i686')
url="https://github.com/timob/${_name}"
license=('GPL2')
depends=('sdl' 'zlib' 'libzip' 'curl')
makedepends=('git')
provides=("${_name}")
conflicts=("${_name}")
source=("${_name}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_name}"
  git log -1 --format="%cd.g%h" --date=short | sed 's/-/./g'
}

build() {
  cd "$srcdir/${_name}/src"
  export CFLAGS="$CFLAGS $CPPFLAGS"
  make PREFIX="/usr"
}

package() {
  cd "$srcdir/${_name}"

  mkdir -p $pkgdir/usr/bin
  install "$SRCDEST"/${_name}.sh $pkgdir/usr/bin/${_name}

  mkdir -p $pkgdir/usr/share/${_name}
  install ${_name} $pkgdir/usr/share/${_name}/
  install -m 644 linapple.installed.conf charset40.bmp font.bmp icon.bmp splash.bmp Master.dsk $pkgdir/usr/share/${_name}/

  mkdir -p $pkgdir/usr/share/doc/${_name}
  install -m 644 CHANGELOG README $pkgdir/usr/share/doc/${_name}/
}

# vim:set ts=2 sw=2 et:

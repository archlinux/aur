# Maintainer: Sindre Moen <sindrenm at gmail dot com>

pkgname=zsh-plugin-wd-git
pkgver=v0.4.0.r38.f859a5c
pkgrel=1
pkgdesc="Jump to custom directories in zsh"
arch=('any')
url="https://github.com/mfaerevaag/wd"
license=('custom:MIT')
groups=()
depends=('zsh')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=$pkgname.install
source=('git+https://github.com/mfaerevaag/wd')
noextract=()
md5sums=('SKIP')

pkgver() {
  cd $srcdir/wd
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
  SRC=$srcdir/wd
  SHARE=$pkgdir/usr/share/wd
  MAN=$pkgdir/usr/share/man/man1
  LICENSES=$pkgdir/usr/share/licenses/$pkgname
  COMPDEFS=$pkgdir/usr/share/zsh/site-functions

  mkdir -p $SHARE
  mkdir -p $MAN
  mkdir -p $LICENSES
  mkdir -p $COMPDEFS

  cd $SRC

  gzip -f wd.1

  cp wd.sh $SHARE
  cp wd.1.gz $MAN
  cp LICENSE $LICENSES
  cp _wd.sh $COMPDEFS/_wd
}

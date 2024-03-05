# Maintainer: Kookies <kookies@tutamail.com>
_pkgbase="openrevolution"
pkgname="$_pkgbase-git"
pkgver=v2.8.1.cca0f4f
pkgrel=2
pkgdesc="C/C++ BRSTM and other format tools - git version"
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url="https://github.com/ic-scm/$_pkgbase"
license=('GPL-3.0-only')
makedepends=('git')
depends=('glibc' 'gcc-libs')
optdepends=('ffmpeg: Audio manipulation with the --ffmpeg option')
provides=($_pkgbase)
conflicts=($_pkgbase)
source=(
	"$_pkgbase"::"git+https://github.com/ic-scm/$_pkgbase"
	"00-skiprtbuild.patch"
)
sha256sums=('SKIP'
           'b24e06f8a0f7493d978a68d4fa21c1c54366fd559f8642fe9618d487965fa6ed'
)

pkgver() {
  cd "$srcdir/$_pkgbase/"
  echo $(git describe --tags).$(git rev-parse --short HEAD)
}

prepare() {
  cd "$srcdir/$_pkgbase/"
  patch --forward --strip=1 --input=../00-skiprtbuild.patch
}	

build() {
  cd "$srcdir/$_pkgbase/"
  sh build.sh
}

package() {
  cd "$srcdir/$_pkgbase/"
  install -m755 -D 'brstm_converter' "$pkgdir/usr/bin/brstm_converter"
  install -m755 -D 'brstm_decoder' "$pkgdir/usr/bin/brstm_decoder"
  install -m755 -D 'brstm_encoder' "$pkgdir/usr/bin/brstm_encoder"
  install -m755 -D 'brstm_reencoder' "$pkgdir/usr/bin/brstm_reencoder"
  install -m755 -D 'brstm_rebuilder' "$pkgdir/usr/bin/brstm_rebuilder"
}

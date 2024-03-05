# Maintainer: Kookies <kookies@tutamail.com>
_pkgbase="openrevolution"
pkgname="$_pkgbase-git"
pkgver=v2.8.1
pkgrel=1
pkgdesc="C/C++ BRSTM and other format tools"
arch=('x86_64')
url="https://github.com/ic-scm/$_pkgbase"
license=('GPL3')
makedepends=('git')
optdepends=('ffmpeg')
provides=($_pkgbase)
conflicts=($_pkgbase)
source=(
	"$_pkgbase"::"git+https://github.com/ic-scm/$_pkgbase"
	"00-skiprtbuild.patch"
)
sha256sums=('SKIP'
           'SKIP'
)

pkgver() {
  cd "$srcdir/$_pkgbase/"
  git describe --tags | sed -e 's/-\([^-]*-g[^-]*\)$/-r\1/' -e 's/-/./g'
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

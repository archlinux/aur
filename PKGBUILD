# Maintainer: Kookies <kookies@tutamail.com>
# Maintainer: Essem <smswessem@gmail.com>

_pkgbase="openrevolution"
pkgname="$_pkgbase-git"
pkgver=v2.9.0.r0.gb826540
pkgrel=1
pkgdesc="C/C++ BRSTM and other format tools - git version"
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url="https://github.com/ic-scm/$_pkgbase"
license=('GPL-3.0-only')
makedepends=('git')
depends=('glibc' 'gcc-libs' 'rtaudio')
optdepends=('ffmpeg: Audio manipulation with the --ffmpeg option')
provides=($_pkgbase)
conflicts=($_pkgbase)
source=(
	"$_pkgbase"::"git+https://github.com/ic-scm/$_pkgbase"
)
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgbase/"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgbase/"
  sh build.sh
}

package() {
  cd "$srcdir/$_pkgbase/"
  install -m755 -D 'brstm_converter' "$pkgdir/usr/bin/brstm_converter"
  install -m755 -D 'brstm_rt' "$pkgdir/usr/bin/brstm_rt"
}

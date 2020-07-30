# Maintainer: Benjamin Bädorf <aur at benjaminbaedorf dot eu>

pkgname=wlstreamer-git
_pkgname=wlstreamer
pkgver=0.1.0.8.g5dc4aef
pkgrel=1
pkgdesc="Wrapper around wf-recorder and ffmpeg that automatically switches the screen being recorded based on current window focus. Works with sway."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://git.b12f.io/b12f/wlstreamer"
license=('GPL3')
makedepends=('git' 'openssl' 'zlib' 'rust' 'cargo')
depends=('sway' 'wf-recorder' 'ffmpeg' 'jq')
provides=()
conflicts=()
source=("$_pkgname::git+https://git.b12f.io/b12f/wlstreamer.git")
md5sums=('SKIP')

pkgver() {
#  cd ${srcdir}/${_pkgname}
  cd "$srcdir/$_pkgname"
  #git rev-list --count HEAD
  echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2|cut -d\- -f1).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"

}

build() {
    return 0
}

package() {
    cd $srcdir
    cargo install --no-track --root="$pkgdir/usr" --git=https://git.b12f.io/b12f/wlstreamer.git
}

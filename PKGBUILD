# Contributor: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)
_pkgname=lossywav
pkgname=$_pkgname-git
pkgver=1.4.2p.r1.r6.g8780b67
pkgrel=1
pkgdesc="lossy audio pre-processor"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
_url_windows="https://sourceforge.net/projects/lossywav/"
_url_posix_old="https://github.com/MoSal/lossywav-for-posix"
url="https://github.com/Sound-Linux-More/lossywav-for-linux"
license=('GPL')
depends=(gcc-libs)
makedepends=('git')
provides=("$_pkgname")
conflicts=(${provides[@]})
source=(
  "$_pkgname::git+$url"
  makefile-ldflags.diff
)
md5sums=(
  'SKIP'
  '65713062cfd510acfcd06ce5ee4b503c'
)

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgname"
  patch -Np1 -i "$srcdir/makefile-ldflags.diff"
}

build() {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm0755 lossywav-static "$pkgdir/usr/bin/lossywav"
  install -Dm0644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:

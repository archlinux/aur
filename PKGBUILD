# Contributor: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)
_pkgname=lossywav
pkgname=$_pkgname-git
pkgver=1.4.2p.r19.g8612808
pkgrel=1
pkgdesc="lossy audio pre-processor to improve flac encoding efficiency"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
_url_windows="https://sourceforge.net/projects/lossywav/"
_url_posix_old="https://github.com/MoSal/lossywav-for-posix"
url="https://github.com/xiota/lossywav-for-posix"
license=('GPL')
depends=('fftw')
makedepends=('git')
provides=("$_pkgname")
conflicts=(${provides[@]})
source=(
  "$_pkgname::git+$url"
)
md5sums=(
  'SKIP'
)

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --tag --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  make fftw-optimized
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm0755 lossywav -t "$pkgdir/usr/bin"
}

# vim:set ts=2 sw=2 et:

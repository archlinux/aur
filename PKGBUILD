# Maintainer: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)
_pkgname=lossywav
pkgname=$_pkgname-git
pkgver=1.4.2p.r1.r0.gd110728
pkgrel=1
pkgdesc="An attempt to port lossyWAV to POSIX."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/MoSal/lossywav-for-posix"
license=('GPL')
depends=('fftw')
makedepends=('git' 'python')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/MoSal/lossywav-for-posix.git")
md5sums=('SKIP')

pkgver() {
 cd "$_pkgname"
 git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
 cd "$_pkgname"
 ./waf configure \
   --prefix="$pkgdir/usr" \
   --enable-fftw3
}

build() {
 cd "$_pkgname"
 ./waf build
}

package() {
 cd "$_pkgname"
 ./waf install --destdir=/
}

# vim:set ts=2 sw=2 et:

# Maintainer: Gustavo Jasso <gustavo at jasso dot info>
_pkgname='reStream'
pkgname=$(echo "$_pkgname-git" | tr '[:upper:]' '[:lower:]')
pkgdesc="Shell script for sharing the reMarkable's screen over SSH."
pkgver=r45.220d387
pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgrel=1
url="https://github.com/rien/reStream"
arch=('any')
license=('MIT')
depends=('openssh' 'ffmpeg')
optdepends=('lz4: sub-second latency streaming (see README)' 'v4l2loopback-dkms: stream reMarkable as a webcam')
source=("git+https://github.com/rien/reStream.git")
md5sums=('SKIP')
conflicts=('restream')
provides=('restream')

package() {
    install -Dm644 "$startdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/$_pkgname/README.md" "$pkgdir/usr/share/$pkgname/README.md"
    install -Dm644 "$srcdir/$_pkgname/extra/demo.gif" "$pkgdir/usr/share/$pkgname/extra/demo.gif"
    install -Dm755 $srcdir/$_pkgname/reStream.sh $pkgdir/usr/bin/restream
}

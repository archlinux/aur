# Maintainer: Simon Vikstrom <aur@devsn.se>

pkgname=cinc
pkgver=16.10.8
pkgrel=1
_ubuntuver=xenial
pkgdesc="The Cinc installation package includes everything you need to start converging your machines."
arch=('x86_64')
url="https://cinc.sh/download/"
license=('Apache')
depends=()
conflicts=(chef chef-solo chef-dk chef-client)
source=("http://downloads.cinc.sh/files/stable/cinc/${pkgver}/ubuntu/20.04/cinc_${pkgver}-1_amd64.deb")
sha256sums=('a16558d84e5538500ea135e62a5bb7bbfd95e04a369a41c2f0d1fe58b30d81e5')

package() {
  cd "$srcdir"
  bsdtar -xf data.tar.xz -C "$pkgdir"

  # link executables
  binaries="cinc-apply cinc-shell knife cinc-client cinc-solo ohai"

  mkdir -p $pkgdir/usr/bin

  for binary in $binaries; do
    ln -s /opt/cinc/bin/$binary $pkgdir/usr/bin/ || error_exit "Cannot link $binary to /usr/bin"
  done
  chown -Rh 0:0 $pkgdir
  chmod 755 $pkgdir/opt
}

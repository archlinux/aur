# Maintainer: Simon Vikstrom <aur@devsn.se>

pkgname=cinc
pkgver=16.12.3
pkgrel=1
_ubuntuver=xenial
pkgdesc="The Cinc installation package includes everything you need to start converging your machines."
arch=('x86_64')
url="https://cinc.sh/download/"
license=('Apache')
depends=()
conflicts=(chef chef-solo chef-dk chef-client)
source=("http://downloads.cinc.sh/files/stable/cinc/${pkgver}/ubuntu/20.04/cinc_${pkgver}-1_amd64.deb")
sha256sums=('81ea1b23068fb1c7069d53b9a9e2eb2497088d156caedba9147f940b7d33cd94')

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

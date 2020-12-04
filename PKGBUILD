# Maintainer: Simon Vikstrom <aur@devsn.se>

pkgname=cinc
pkgver=16.7.61
pkgrel=1
_ubuntuver=xenial
pkgdesc="The Cinc installation package includes everything you need to start converging your machines."
arch=('x86_64')
url="https://cinc.sh/download/"
license=('Apache')
depends=()
conflicts=(chef chef-solo chef-dk)
source=("http://downloads.cinc.sh/files/stable/cinc/${pkgver}/ubuntu/20.04/cinc_${pkgver}-1_amd64.deb")
sha256sums=('6e9e636e3febb65b6e36cedbac6247e8f65e876027cd0cbc48ba5f181a860c03')

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

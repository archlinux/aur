# Maintainer: Simon Vikstrom <aur@devsn.se>

pkgname=cinc
pkgver=16.0.287
pkgrel=1
_ubuntuver=xenial
pkgdesc="The Cinc installation package includes everything you need to start converging your machines."
arch=('x86_64')
url="https://cinc.sh/download/"
license=('Apache')
depends=()
conflicts=(chef chef-solo chef-dk)
source=("http://downloads.cinc.sh/files/stable/cinc/${pkgver}/ubuntu/20.04/cinc_${pkgver}-1_amd64.deb")
sha256sums=('98aad2e4a30377c71b59147c0f90b2904505cf7c70591d868ea02003f9d8e9d5')

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

# Maintainer: Simon Stridsberg <aur@devsn.se>

pkgname=cinc-workstation-bin
pkgver=22.1.745
pkgrel=1
pkgdesc="The Cinc installation package includes everything you need to start converging your machines."
arch=('x86_64')
url="https://cinc.sh/download/"
license=('Apache')
depends=()
conflicts=(chef chef-solo chef-dk chef-client cinc)
source=("http://downloads.cinc.sh/files/unstable/cinc-workstation/${pkgver}/ubuntu/20.04/cinc-workstation_${pkgver}-1_amd64.deb")
sha256sums=('0d0bfae1fba9e37ccce44ff5baae6d56ceaca906aea6035b8ed345101894f096')

package() {
  cd "$srcdir"
  bsdtar -xf data.tar.xz -C "$pkgdir"

  # link executables
  binaries="cinc-apply cinc-shell knife cinc-client cinc-solo ohai"

  mkdir -p $pkgdir/usr/bin

  for binary in $binaries; do
    ln -s /opt/cinc-workstation/bin/$binary $pkgdir/usr/bin/ || error_exit "Cannot link $binary to /usr/bin"
  done
  chown -Rh 0:0 $pkgdir
  chmod 755 $pkgdir/opt
}

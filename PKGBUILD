# Maintainer: Cedric Felizard <cedric@felizard.fr>
# Contributor: Simon Stridsberg <aur@devsn.se>
# Contributor: kiromantia <aur@dataclast.network>

pkgname=cinc-workstation-bin
pkgver=26.2.3
pkgrel=1
pkgdesc="The Cinc installation package includes everything you need to start converging your machines."
arch=('x86_64')
url="https://cinc.sh/download/"
license=('Apache-2.0')
depends=(libxcrypt-compat)
conflicts=(chef chef-solo chef-dk chef-client cinc)
source=("http://downloads.cinc.sh/files/stable/cinc-workstation/${pkgver}/ubuntu/24.04/cinc-workstation_${pkgver}-1_amd64.deb")
sha256sums=('78571fc2f3d564bc32c92b18f2ab8e653ebded4c08eecff5b47904677d701fe7')

package() {
  cd "$srcdir"
  bsdtar -xf data.tar.xz -C "$pkgdir"

  # link executables
  binaries="cinc cinc-apply cinc-auditor cinc-cli cinc-client cinc-shell cinc-solo cookstyle kitchen knife ohai"

  mkdir -p $pkgdir/usr/bin

  for binary in $binaries; do
    ln -s /opt/cinc-workstation/bin/$binary $pkgdir/usr/bin/ || error_exit "Cannot link $binary to /usr/bin"
  done
  chown -Rh 0:0 $pkgdir
  chmod 755 $pkgdir/opt
}

# Maintainer: Simon Vikstrom <aur@devsn.se>

pkgname=chef-client
pkgver=13.7.16
pkgrel=1
_ubuntuver=xenial
pkgdesc="The Chef Client installation package includes everything you need to start converging your machines."
arch=('x86_64')
url="https://downloads.chef.io/chef-client/"
license=('Apache')
depends=()
conflicts=( chef chef-solo )
source=("https://packages.chef.io/files/stable/chef/${pkgver}/ubuntu/16.04/chef_${pkgver}-1_amd64.deb")
sha256sums=('3d1d511337c1a75518ec21f9d22c8f7498f3db6c2b61aa1c2c1b28ebd66b987e')

package() {
  cd "$srcdir"
  bsdtar -xf data.tar.xz -C "$pkgdir"

  # link executables
  binaries="chef-apply chef-shell knife chef-client chef-solo ohai"

  mkdir -p $pkgdir/usr/bin

  for binary in $binaries; do
    ln -s /opt/chef/bin/$binary $pkgdir/usr/bin/ || error_exit "Cannot link $binary to /usr/bin"
  done
  chown -Rh 0:0 $pkgdir
  chmod 755 $pkgdir/opt
}

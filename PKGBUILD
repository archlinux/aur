# Maintainer: Simon Vikstrom <aur@devsn.se>

pkgname=chef-client
pkgver=16.10.8
pkgrel=1
_ubuntuver=xenial
pkgdesc="The Chef Client installation package includes everything you need to start converging your machines."
arch=('x86_64')
url="https://downloads.chef.io/chef-client/"
license=('Apache')
depends=()
conflicts=(chef chef-solo chef-dk cinc)
source=("https://packages.chef.io/files/stable/chef/${pkgver}/ubuntu/20.04/chef_${pkgver}-1_amd64.deb")
sha256sums=('ad6d3550baa83e4a494856582a3a352c9aa02905e8a31648306ec795ca707cf3')

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

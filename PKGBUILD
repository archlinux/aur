# Maintainer: Simon Vikstrom <aur@devsn.se>

pkgname=chef-client
pkgver=13.6.4
pkgrel=1
_ubuntuver=xenial
pkgdesc="The Chef Client installation package includes everything you need to start converging your machines."
arch=('x86_64')
url="https://downloads.chef.io/chef-client/"
license=('Apache')
depends=()
conflicts=( chef chef-solo )
source=("https://packages.chef.io/files/stable/chef/${pkgver}/ubuntu/16.04/chef_${pkgver}-1_amd64.deb")
sha256sums=('c523feb2494b407d71c56261035a58b6897ec6312f917477ef0b3fc4e27c072d')

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

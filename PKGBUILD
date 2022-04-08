# Maintainer: Томас <70m4c@70m4c.su>

pkgname=chef-client
pkgver=16.12.3
pkgrel=1
pkgdesc="The Chef Client installation package includes everything you need to start converging your machines."
arch=('x86_64')
url="https://downloads.chef.io/chef-client/"
license=('Apache')
depends=()
conflicts=(chef chef-solo chef-dk cinc)
source=("https://packages.chef.io/files/stable/chef/${pkgver}/ubuntu/20.04/chef_${pkgver}-1_amd64.deb")
sha256sums=('e2ef7f9bb58a466ab9cce93e4a593cb62eaa49c6e7719d6cff0cb1d92b279a7a')

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

# Maintainer: Felix Golatofski <contact@xdfr.de>

pkgname=chef-server
pkgver=13.2.0
pkgrel=1
_ubunturel=1
pkgdesc="The Chef server works with the Chef client as a central artifact store and distribution mechanism that manages scale, complexity, and safeguarding your systems. "
arch=('x86_64')
url="https://downloads.chef.io/chef-server/"
license=('Apache')
depends=()
conflicts=( chef chef-solo chef-client chef-dk )
source=("https://packages.chef.io/files/stable/chef-server/${pkgver}/ubuntu/18.04/chef-server-core_${pkgver}-${_ubunturel}_amd64.deb")
sha256sums=('c80d63471e173188f656ff36e74afbbc97524f764f3a41cdcc51bd4fedc659a8')

package() {
  cd "$srcdir"
  bsdtar -xf data.tar.xz -C "$pkgdir"

  # link executables
  binaries="chef-apply chef-client chef-server-ctl chef-shell chef-solo gather-logs knife ohai"

  mkdir -p $pkgdir/usr/bin

  for binary in $binaries; do
    ln -s /opt/opscode/bin/$binary $pkgdir/usr/bin/ || error_exit "Cannot link $binary to /usr/bin"
  done
  chown -Rh 0:0 $pkgdir
  chmod 755 $pkgdir/opt
}

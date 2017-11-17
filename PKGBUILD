pkgname=chef-server
pkgver=12.17.5
pkgrel=1
_ubunturel=1
pkgdesc="The Chef server works with the Chef client as a central artifact store and distribution mechanism that manages scale, complexity, and safeguarding your systems. "
arch=('x86_64')
url="https://downloads.chef.io/chef-server/"
license=('Apache')
depends=()
conflicts=( chef chef-solo chef-client chef-dk )
source=("https://packages.chef.io/files/stable/chef-server/${pkgver}/ubuntu/16.04/chef-server-core_${pkgver}-${_ubunturel}_amd64.deb")
sha256sums=('a82ecaf04add5a08735909f61ada16088731f0cae5599e46558a75dc5c8239eb')

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

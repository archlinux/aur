pkgname=chef-server
pkgver=12.15.8
pkgrel=1
_ubuntuver=raring
_ubunturel=4
pkgdesc="The Chef server works with the Chef client as a central artifact store and distribution mechanism that manages scale, complexity, and safeguarding your systems. "
arch=('x86_64')
url="https://downloads.chef.io/chef-server/"
license=('Apache')
depends=()
conflicts=( chef chef-solo chef-client chef-dk )
source=("https://packages.chef.io/files/stable/chef-server/${pkgver}/ubuntu/16.04/chef-server-core_${pkgver}-1_amd64.deb")
sha512sums=('ddaf5feabab8a1ff3ad8521d54f140859351a78d4b07333168c0e7ec1e41150e9d5077f222f349c4d5d9f538d97bf3940248b804002a63e7e1f64252e1280edf')

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

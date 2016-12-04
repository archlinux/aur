# Maintainer: xpt <user.xpt@gmail.com>
pkgname=prey-node-client
pkgver=1.6.4
pkgrel=1
pkgdesc="Remote tracking and monitoring application for laptops, smartphones, and other electronic devices"
url="https://preyproject.com/"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('nodejs' 'mpg123' 'xawtv' 'scrot' 'openssh' 'wireless_tools' 'lsb-release' 'python2' 'pygtk' 'networkmanager' 'npm')
replaces=('prey-tracker')
# Should be used as soon as the bash client is renamed
#provides=('prey-tracker')
install='prey-node-client.install'
source=('prey-node-client.patch')
source_x86_64=("https://prey-releases.s3.amazonaws.com/node-client/$pkgver/prey-linux-$pkgver-x64.zip")
source_i686=("https://prey-releases.s3.amazonaws.com/node-client/$pkgver/prey-linux-$pkgver-x86.zip")
sha256sums=('181785784b44de48ff8ad0601f2a88a00ff4c26fe95b2c075546f23dc54de8c5')
sha256sums_x86_64=('e2cab0423a14c83efa1d914a156cfa7c6708588ee39961cd9102710d76598301')
sha256sums_i686=('2944112e47650179f2dc633402da04c66628631788f9d7df63ee0a18c242ef35')


package() {
  cd "$srcdir/prey-$pkgver"

  # Now, we use prey's node, so we don't delete bin/node
  # --------------------------------
  # We don't need the bundled node.js as we have it installed in the system.
  # Conveniently, the bash script probes for node.js and automatically uses
  # the system node if the bundled one is not found.
  # rm bin/node

  # Fix symlink path, Python shebangs and default-disable automatic updates
  patch -p0 < ${srcdir}/prey-node-client.patch

  mkdir -p "$pkgdir/opt/prey-node-client/"
  cp -r ./* "$pkgdir/opt/prey-node-client/"
  install -Dm644 license.txt "$pkgdir/usr/share/licenses/$pkgname/license.txt"

  mkdir -p "$pkgdir/usr/bin/"
  # Binary prey named as prey_project
  ln -s /opt/prey-node-client/bin/prey "$pkgdir/usr/bin/prey_project"
}

# vim:set ts=2 sw=2 et: 

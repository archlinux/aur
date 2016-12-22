# Maintainer: xpt <user.xpt@gmail.com>
pkgname=prey-node-client
pkgver=1.6.5
pkgrel=2
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
sha256sums_x86_64=('6950e09c9ae94b3cec5eb0ad89a7303cc13a6d4f0bc38ce054e866241c9b1b31')
sha256sums_i686=('7165ae486804eb6421e6a23f7edbcfb85dc180aa83a0b10776de34e7697277d6')


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

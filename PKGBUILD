# Maintainer: Marvin1099
pkgname=smb-mount-controller-git
pkgver=0.1.2
pkgrel=1
pkgdesc="A state-based SMB/CIFS mount controller written in bash for Linux that (un)mounts network shares based on reachability"
arch=('any')
url="https://codeberg.org/marvin1099/smb-mount-controller"
license=('AGPL3')
depends=('bash' 'cifs-utils' 'netcat')
optdepends=('systemd: for systemd service file support')
source=("git+https://codeberg.org/marvin1099/smb-mount-controller.git")
md5sums=('SKIP')
install=smb-controller.install

prepare() {
  cd "smb-mount-controller"
  git submodule update --init --recursive
}

package() {
  cd "smb-mount-controller"
  install -Dm755 smb-controller.sh "$pkgdir/usr/local/bin/smb-controller"
  install -Dm644 example-smb-controller.conf "$pkgdir/etc/smb-controller-default.conf"
  install -Dm644 default-smb-controller.service "$pkgdir/etc/systemd/system/smb-controller.service"
}

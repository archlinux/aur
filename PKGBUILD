# Maintainer: Marvin1099
pkgname=smb-mount-controller-git
pkgver() {
  git -C "$srcdir/smb-mount-controller-git" describe --tags --abbrev=0 2>/dev/null || git -C "$srcdir/smb-mount-controller-git" rev-parse --short HEAD
}
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
  cd "$pkgname"
  git submodule update --init --recursive
}

package() {
  cd "$pkgname"
  install -Dm755 smb-controller.sh "$pkgdir/usr/local/bin/smb-controller"
  install -Dm644 example-smb-controller.conf "$pkgdir/etc/smb-controller-default.conf"
  install -Dm644 default-smb-controller.service "$pkgdir/etc/systemd/system/smb-controller.service"
}
# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Francois Boulogne <fboulogne at april dot org>

pkgname=python38-watchdog
pkgver=2.1.9
pkgrel=1
pkgdesc="Python API and shell utilities to monitor file system events"
arch=('any')
url="https://github.com/gorakhargosh/watchdog"
license=('Apache')
depends=('python38')
optdepends=('python38-yaml: for watchmedo')
makedepends=('python38-setuptools')
checkdepends=('python38-pytest' 'python38-pytest-timeout')
source=($pkgname-$pkgver.tar.gz::https://github.com/gorakhargosh/watchdog/archive/v$pkgver.tar.gz)
sha512sums=('1005c48b08968db7705acbb8a94a0852c72d8bcf45ac935e7e0b49daa6e422adb081cf431485618b37bcc1b2d3429369af1672b826bf9c1ebfa7aff91a88175a')

prepare() {
  cd watchdog-$pkgver
  sed -i '/--cov/d' setup.cfg
}

build() {
  cd watchdog-$pkgver
  python3.8 setup.py build
}

check() {
  cd watchdog-$pkgver
  # Invokes sudo
  PYTHONPATH="$PWD/build/lib" pytest --deselect tests/test_inotify_buffer.py::test_unmount_watched_directory_filesystem
}

package() {
  cd watchdog-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
}

# vim:ts=2:sw=2:et:

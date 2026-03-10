# Maintainer: Anthony25 <Anthony Ruhier>
#
# Thanks to Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com> for
# his PKGBUILD that served as a base for this one

pkgname=virt-backup
pkgver=0.5.7
pkgrel=1
pkgdesc="Automatic backups for Libvirt"
arch=(any)
url="https://github.com/Anthony25/virt-backup"
license=(BSD)
makedepends=(
  python-setuptools
)
depends=(
  libvirt-python
  python-arrow
  python-lxml
  python-yaml
  python-platformdirs
)
optdepends=(
  'python-zstandard: zstd packager support'
)
options=(!emptydirs)
source=("https://github.com/Anthony25/virt-backup/archive/v${pkgver}.tar.gz")
sha256sums=('152c9213eac89d45531954eb650f0d48f34c36e4e791c8c8a8c3abcb0f141f6e')

build() {
  cd "virt-backup-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "virt-backup-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -D -m644 example/virt-backup-clean.service "$pkgdir/usr/lib/systemd/system/virt-backup-clean.service"
}

# vim:set ts=2 sw=2 et:

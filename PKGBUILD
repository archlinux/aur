# Maintainer: Anthony25 <Anthony Ruhier>
#
# Thanks to Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com> for
# his PKGBUILD that served as a base for this one

pkgname=virt-backup
pkgver=0.4.0
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
  python-appdirs
  python-argparse
  python-arrow
  python-defusedxml
  python-lxml
  python-yaml
)
optdepends=(
  'python-zstandard: zstd packager support'
)
options=(!emptydirs)
source=("https://github.com/Anthony25/virt-backup/archive/v${pkgver}.tar.gz")
sha256sums=('9233d9fff887cb16f683d3155e05713ddd45e18b3dfabd69dd9e44d4f0f73731')

package() {
  cd "${srcdir}/virt-backup-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1

  install -D -m644 example/virt-backup-clean.service "$pkgdir/usr/lib/systemd/system/virt-backup-clean.service"
}

# vim:set ts=2 sw=2 et:

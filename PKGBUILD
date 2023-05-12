# Maintainer: Anthony25 <Anthony Ruhier>
#
# Thanks to Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com> for
# his PKGBUILD that served as a base for this one

pkgname=virt-backup
pkgver=0.5.5
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
  python-arrow
  python-lxml
  python-yaml
)
optdepends=(
  'python-zstandard: zstd packager support'
)
options=(!emptydirs)
source=("https://github.com/Anthony25/virt-backup/archive/v${pkgver}.tar.gz")
sha256sums=('fc243507d3e6393e92e40a31913a020751872e284f5e56993c48ee98d7feecfb')

package() {
  cd "${srcdir}/virt-backup-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1

  install -D -m644 example/virt-backup-clean.service "$pkgdir/usr/lib/systemd/system/virt-backup-clean.service"
}

# vim:set ts=2 sw=2 et:

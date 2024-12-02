# Maintainer: Antheas Kapenekakis <aur at antheas dot dev>
pkgname=adjustor
pkgver=3.6.0
pkgrel=1
pkgdesc='Adjustor, a userspace program for managing the TDP of handheld devices.'
arch=('x86_64')
url='https://github.com/hhd-dev/adjustor'
license=('GPL-3.0-or-later')
depends=('python' 'python-rich' 'python-pyroute2' 'python-fuse' 'python-gobject')
provides=('adjustor')
optdepends=('hhd: adds adjustor to the hhd ui.' 'acpi_call: required for setting TDP (may be provided as a kernel patch).')
makedepends=('python-'{'build','installer','setuptools','wheel','fuse'})
source=("https://pypi.python.org/packages/source/a/adjustor/adjustor-${pkgver}.tar.gz")
sha512sums=('77a76e4cb7f004acfd4306b2d9750390d405717c83ee8e5a9a22ec28bfab6bcf46e8f75b6b2d7e3557b87c8e50b7e411b2b6597961baa70ccf873075be817133')

build() {
  cd "adjustor-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "adjustor-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
	# mkdir -p ${pkgdir}/usr/share/dbus-1/system.d/
  # install -m644 usr/share/dbus-1/system.d/hhd-net.hadess.PowerProfiles.conf ${pkgdir}/usr/share/dbus-1/system.d/hhd-net.hadess.PowerProfiles.conf
}

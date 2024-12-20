# Maintainer: d10n <david at bitinvert dot com>

pkgname=subscription-manager-git
_name=${pkgname%-git}
pkgver=1.30.3.1.r2.g76d9858f9
pkgrel=1
pkgdesc='subscription-manager'
arch=(x86_64)
url='https://www.candlepinproject.org/docs/subscription-manager/'
license=(GPL-2.0-only)
provides=(subscription-manager)
depends=(python dnf libdnf rpm-tools python-iniparse openssl glibc glib2 python-dbus python-dateutil python-requests python-setuptools python-gobject python-pyinotify)
optdepends=(
    subscription-manager-rhsm-certificates
)
makedepends=(git python-build python-installer python-wheel)
source=("git+https://github.com/candlepin/$_name.git")
b2sums=('SKIP')

pkgver() {
  cd "$_name"
  git describe --long --match='subscription-manager-*' | sed 's/^subscription-manager-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$_name"
    #make build
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name"
    #make DESTDIR="$pkgdir" PREFIX=/usr OS_DIST=debian install
    #mv -i "${pkgdir}/usr/sbin/subscription-manager" "${pkgdir}/usr/bin"
    #rmdir "${pkgdir}/usr/sbin/"
    python -m installer --destdir="$pkgdir" dist/*.whl
}


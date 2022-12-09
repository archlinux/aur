# Maintainer: Sabu Siyad <hello@ssiyad.com>
# This PKGBUILD is maintained at https://github.com/ssiyad/pkgbuilds/

pkgname=frappe-bench
pkgver=5.15.2
pkgrel=3
pkgdesc="CLI to manage Multi-tenant deployments for Frappe apps"
arch=('x86_64')
url="https://github.com/frappe/bench"

makedepends=(
    "git"
    "python-build"
    "python-hatchling"
    "python-installer"
    "python-wheel"
)

depends=(
    "cronie"
    "nodejs"
    "python"
    "python-click"
    "python-crontab"
    "python-gitpython"
    "python-jinja"
    "python-requests"
    "python-semantic-version"
    "python-setuptools"
    "python-tomli"
    "redis"
    "ruby-foreman"
    "yarn"
)

optdepends=(
    "mariadb: to run database driven apps"
    "nginx: proxying multitenant sites in production"
    "postgresql: to run database driven apps"
    "python-pip: py dependency manager"
    "wkhtmltopdf: for pdf generation"
)

provides=("bench")
source=(
    "$pkgname::git+$url#tag=v$pkgver"
)
sha256sums=("SKIP")

build() {
    cd $srcdir/$pkgname
    python -m build --wheel --no-isolation
}

package() {
    cd $srcdir/$pkgname
    python -m installer --destdir=$pkgdir dist/*.whl
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

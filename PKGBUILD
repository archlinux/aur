# Maintainer: Sabu Siyad <hello@ssiyad.com>
# This PKGBUILD is maintained at https://github.com/ssiyad/pkgbuilds/

pkgname=frappe-bench
pkgver=5.14.3
pkgrel=1
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
    "python"
    "python-click"
    "python-gitpython"
    "python-jinja"
    "python-crontab"
    "python-requests"
    "python-semantic-version"
    "python-setuptools"
    "python-tomli"
)

optdepends=(
    "yarn: js dependency manager"
    "python-pip: py dependency manager"
    "wkhtmltopdf: for pdf generation"
    "cronie: bench's scheduled jobs: automated certificate renewal, scheduled backups"
    "nginx: proxying multitenant sites in production"
    "redis: caching and realtime updates"
    "mariadb: to run database driven apps"
    "postgresql: to run database driven apps"
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

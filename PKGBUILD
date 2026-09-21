# Maintainer: Agil Mammadov <mammadovagil@proton.me>
# Contributor: Ivan Batrakov <blackfan321 at disroot dot org>
# Contributor: NIgel Kukard <nkukard at LBSD dot net>
# Contributor: RcrdBrt

pkgname=python-flask-admin
_pkgname=flask-admin
_name=flask_admin
pkgver=2.2.1
pkgrel=1
pkgdesc="Simple and extensible admin interface framework for Flask"
url="https://github.com/flask-admin/flask-admin/"
depends=(python python-flask python-jinja python-markupsafe python-werkzeug python-wtforms)
makedepends=(python-build python-installer python-wheel python-flit)
license=('BSD-3-Clause')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
	"LICENSE::https://raw.githubusercontent.com/flask-admin/flask-admin/v$pkgver/LICENSE")
sha256sums=('08b4b6b63d2100598add70c1dc9a695f484e3c16c894c09ac70af26acb26a87d'
            '7052007174ecc90a2b91e7bf25132d463caae33adef281c54db9601ac0a61607')

build() {
    cd "$srcdir/$_name-$pkgver"
    python3 -m build --wheel
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

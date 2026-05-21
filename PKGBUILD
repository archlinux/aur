# Maintainer: Agil Mammadov <mammadovagil@tutamail.com>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname="python-textual-fspicker"
_pkgname=${pkgname#python-}
_name=${_pkgname//-/_}
pkgver=1.0.1
pkgrel=2
pkgdesc="A simple Textual filesystem picker dialog library"
arch=('any')
url='https://github.com/davep/textual-fspicker'
license=('MIT')
depends=('python' 'python-textual')
optdepends=()
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-uv-build' 'python-installer')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_name}/${_name}-$pkgver.tar.gz"
        "LICENSE::https://raw.githubusercontent.com/davep/textual-fspicker/v$pkgver/LICENSE")
sha256sums=('58f7fa983ded7a5ed69b7279f66de57a0ef6fad0e3acb622f217682e85986c9c'
            '9a3f784f2f73961691644b9f24eee2a82f761d9a0220e66786feadde9a38c124')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

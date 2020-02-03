# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')

# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net

pkgname=python-pychroot
pkgver=0.10.1
pkgrel=1
pkgdesc="A python library and CLI tool that simplifies chroot handling"
arch=('any')
url="https://pypi.python.org/pypi/pychroot/"
license=('BSD')
depends=('python' 'python-snakeoil')
makedepends=('python' 'python-snakeoil' 'python-setuptools')
_pkgname=pychroot
install=
changelog=
noextract=()
source=("https://files.pythonhosted.org/packages/source/p/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        "${_pkgname}-${pkgver}.tar.gz.sig")
sha512sums=('4df7f405872b693bf9ecac331927f749653b7251a49eaa10c423357f3150bbcbea73052ec4363a0f510aaeecd6b467d985402a8f764e99e67f5882e6b2ea4f97'
            'SKIP')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
        python3 setup.py build || return 1
}

package() {
	PYVER=$(python --version | sed -re 's/^Python[[:space:]]*([0-9]\.[0-9])\.[0-9]*/\1/g')
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python3 setup.py install --root="${pkgdir}" --optimize=1 || return 1
	install -D -m 0644 ${srcdir}/${_pkgname}-${pkgver}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
	ln -sf ${pkgdir}/usr/bin/${_pkgname} ${pkgdir}/usr/lib/python${PYVER}/site-packages/pychroot/scripts/__init__.py
}

# Maintainer: t-onoz <t [dot] onozuka [dot] 1990 [at] (g-mail)>>
pkgbase='python2-backports.tempfile'
pkgname=('python2-backports.tempfile')
_module='backports.tempfile'
pkgver='1.0'
pkgrel=2
pkgdesc="Backport of new features in Python's tempfile module"
url="https://github.com/pjdelport/backports.tempfile"
depends=('python2' 'python2-backports.weakref')
makedepends=('python2-setuptools')
license=('Python')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('1c648c452e8770d759bdc5a5e2431209be70d25484e1be24876cf2168722c762')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    rm "$pkgdir/usr/lib/python2.7/site-packages/backports/__init__.py"*
}

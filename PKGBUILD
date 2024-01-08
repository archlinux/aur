# Maintainer: Augusto Modanese <augusto.modanese@aalto.fi>
# Contributor: Simon Tas <simon.tas.st@gmail.com>

pkgname="python-myougiden"
_pkgname="myougiden"
pkgver=0.8.8
pkgrel=1
pkgdesc="A command-line, Japanese/English English/Japanese dictionary"
arch=('any')
url="https://pypi.python.org/pypi/$_pkgname"
license=('GPLv3')
depends=('python>=3.0' 'python-romkan' 'python-termcolor')
makedepends=('git')
optdepends=('python-argparse: for Python ≤ 3.1' 'python-psutil: for Python ≤ 3.2' 'rsync: recommended')
provides=('python-myougiden' 'myougiden' 'updatedb-myougiden')
backup=('etc/myougiden/config.ini')
source=("https://files.pythonhosted.org/packages/31/b6/f3d824f6854841a85d2d6ef3908e19277122a5ff6e2c8620eaf186218479/$_pkgname-$pkgver.tar.gz")
md5sums=('6e82909bd3dd5ee39620e5717ac3b97c')

build() {
	cd ${srcdir}/${_pkgname}-${pkgver}
    python setup.py build
}

package() {
	cd ${srcdir}/${_pkgname}-${pkgver}
    
    python setup.py install --root="${pkgdir}" --optimize=1
    
    install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    
    echo -e "${RED}run 'sudo updatedb-myougiden -f' to create or update the database, this may take a while.${NC}"
}
 

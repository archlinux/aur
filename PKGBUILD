# Maintainer: Augusto Modanese <augusto.modanese@aalto.fi>
# Contributor: Simon Tas <simon.tas.st@gmail.com>

pkgname="python-myougiden"
_pkgname="myougiden"
pkgver=0.8.9
pkgrel=1
pkgdesc="A command-line, Japanese/English English/Japanese dictionary"
arch=('any')
url="https://pypi.python.org/pypi/$_pkgname"
license=('GPLv3')
depends=('python>=3.0' 'python-romkan' 'python-termcolor')
makedepends=('git')
optdepends=('python-psutil: for Python ≤ 3.2' 'rsync: recommended')
provides=('python-myougiden' 'myougiden' 'updatedb-myougiden')
backup=('etc/myougiden/config.ini')
source=("https://files.pythonhosted.org/packages/32/19/dcf6697149e9f421c88588fd20752cdc5fb50460470f0f523f5ffb64059c/$_pkgname-$pkgver.tar.gz")
sha256sums=('3fbadd41fc00808447c88271ca65414f5b7f02e3186e037c576844a5abf0d36a')

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
 


# Maintainer: Simon Tas <simon.tas.st@gmail.com>
pkgname="python-myougiden-git"
_pkgname="myougiden"
pkgver=0.8.8
pkgrel=1
pkgdesc="A command-line, Japanese/English English/Japanese dictionary"
arch=('any')
url="https://github.com/leoboiko/myougiden"
license=('GPLv3')
depends=('python>=3.0' 'python-romkan' 'python-termcolor')
makedepends=('git')
optdepends=('python-argparse: for Python ≤ 3.1' 'python-psutil: for Python ≤ 3.2' 'rsync: recommended')
provides=('python-myougiden' 'myougiden' 'updatedb-myougiden')
backup=('etc/myougiden/config.ini')
source=("git+https://github.com/leoboiko/${_pkgname}")
md5sums=('SKIP')

build() {
	cd ${srcdir}/${_pkgname}
    python setup.py build
}

package() {
	cd ${srcdir}/${_pkgname}
    rm -rf .git*
    
    python setup.py install --root="${pkgdir}" --optimize=1
    
    install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    
    echo -e "${RED}run 'sudo updatedb-myougiden -f' to create or update the database, this may take a while.${NC}"
}

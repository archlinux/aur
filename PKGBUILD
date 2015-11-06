# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=project-generator
_pkgname=${pkgname/-/_}
pkgver=0.7.8
pkgrel=1
pkgdesc="Project generators for various embedded tools (IDE)"
url="https://github.com/project-generator/project_generator"
depends=('python'
         'python-pip'
         'python-yaml'
         'python-jinja'
         'python-xmltodict'
         'project-generator-definitions'
         )
optdepends=()
license=('Apache')
arch=('any')
_pkgver='526cb5beab1eee4c18311d860f16080c26f75b66'
source=("https://github.com/project-generator/${_pkgname}/archive/${_pkgver}.tar.gz")
sha512sums=('78083fb121d06112e9dc1f53754be497bdf555d22f8e203791a1711fde2eca3219a17e4de3e9b4dad5e3aed52ec937828a2132f808f6ef6fc240329e08ee9b2b')

build() {
    cd "$srcdir/$_pkgname-$_pkgver"

    # Python3 has argparse
    sed -i -e '/argparse/d' requirements.txt

    python setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$_pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 
}


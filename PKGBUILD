# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=project-generator
pkgver=0.11.1
pkgrel=1
pkgdesc="Project generators for various embedded tools (IDE)"
url="https://github.com/project-generator/project_generator"
depends=('python'
         'python-setuptools'
         'python-yaml'
         'python-jinja'
         'python-xmltodict'
         'project-generator-definitions'
         )
optdepends=()
license=('Apache')
arch=('any')
source=("https://github.com/project-generator/${pkgname/-/_}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('aac872aac93dff8f7d0950a0a0dbd73bff139152bdf3173caf9e1005be48f35b359813b10bfe37949d86ffc7d5b1ddc46efc4ba205d30c51bf47e173fdbdc31f')

prepare() {
    mv "${srcdir}/${pkgname//-/_}-${pkgver}" "${srcdir}/${pkgname}-${pkgver}"
    cp -a "${srcdir}/${pkgname}-${pkgver}"{,-py2}
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python  setup.py install --root="${pkgdir}" --optimize=1
}

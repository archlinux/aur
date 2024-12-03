# Maintainer: Maciej Dems <macdems@gmail.com>
pkgbase='python-dash-bootstrap-components'
pkgname=('python-dash-bootstrap-components')
_module='dash-bootstrap-components'
_wheel='dash_bootstrap_components'
pkgver=1.6.0
pkgrel=1
pkgdesc="Bootstrap themed components for use in Plotly Dash"
url="https://dash-bootstrap-components.opensource.faculty.ai/"
depends=('python' 'python-dash')
makedepends=(python-setuptools python-build python-installer python-semver python-invoke python-termcolor npm)
optdepends=("python-pandas: for DataTable component")

license=('APACHE')
arch=('any')
source=("${_module}-${pkgver}.tar.gz::https://github.com/facultyai/dash-bootstrap-components/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('fce4e36d76409cf35d85234630b9e809687d4cc76a156aa3bc36559224461f8a')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    npm install
    npm run build
    python -m build --wheel . --outdir "${srcdir}" --no-isolation
}

package() {
    python -m installer "${srcdir}/${_wheel}-${pkgver}-py3-none-any.whl" --destdir="${pkgdir}"
}

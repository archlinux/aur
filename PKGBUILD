# Maintainer: Maciej Dems <macdems@gmail.com>
pkgbase='python-dash-bootstrap-components'
pkgname=('python-dash-bootstrap-components')
_module='dash-bootstrap-components'
_wheel='dash_bootstrap_components'
pkgver=2.0.4
pkgrel=1
pkgdesc="Bootstrap themed components for use in Plotly Dash"
url="https://dash-bootstrap-components.opensource.faculty.ai/"
depends=('python' 'python-dash')
makedepends=(python-setuptools python-build python-installer python-semver python-invoke python-termcolor npm)
optdepends=("python-pandas: for DataTable component")

license=('APACHE')
arch=('any')
source=("${_module}-${pkgver}.tar.gz::https://github.com/facultyai/dash-bootstrap-components/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('39c4b6d21eec05aef97ac874cf2b4abf7940af9188521a095af35dfd2630258f')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    npm install
    npm run build
    python -m build --wheel . --outdir "${srcdir}" --no-isolation
}

package() {
    python -m installer "${srcdir}/${_wheel}-${pkgver}-py3-none-any.whl" --destdir="${pkgdir}"
}

# Maintainer: Oystein Sture <oysstu@gmail.com>
# Contributor: 

pkgname=python-paramz
pkgver=0.9.2
pkgrel=2
pkgdesc="Parameterization Framework for parameterized model creation and handling"
arch=("any")
license=("BSD")
url="https://github.com/sods/paramz"
depends=('python' 'python-numpy' 'python-scipy' 'python-six' 'python-decorator')
optdepends=('ipython' 'python-sphinx' 'python-ipykernel' 'python-ipywidgets' 'python-jupyter_client' 'jupyter-notebook')
makedepends=()
source=("https://github.com/sods/paramz/archive/v${pkgver}.tar.gz"
        "re-3.7.patch")
sha512sums=("cc63e312dd927bab4f82257ada3a74e5ebd7b349ef765f06171cfa2b40876325c20fb28d268e6824adc1dbe350575e77994292dcc74446c5c16ab53c201b6542"
            "01db6862d20f222c83b35008c5b02b5fec60e3103e0f729444b3e07e7a1e2e7b74569b9ef6d4ceb3c9674c929391d2e97f41f96f6c2677e5d08e89e446b732c3")

prepare(){
    # re._pattern_type renamed to re.Pattern in 3.7
    patch -p1 -i re-3.7.patch
}

build() {
    cd "paramz-${pkgver}"
    python setup.py build
}

package() {
    cd "paramz-${pkgver}"
    python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/python-paramz/LICENSE"
}

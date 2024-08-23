pkgname=pyrobbo
pkgver=0.5.0
pkgrel=1
pkgdesc="Clone of an old 8-bit Atari game Robbo"
url="http://github.com/macdems/pyrobbo"
depends=('python' 'python-pygame' 'python-yaml' 'python-appdirs' 'python-setuptools')
makedepends=('python-setuptools' 'python-build' 'python-wheel')
license=('GPL3')
arch=('any')
source=(
    "https://files.pythonhosted.org/packages/source/P/PyRobbo/pyrobbo-$pkgver.tar.gz"
    'pyrobbo.desktop'
    'robbo.png'
)
sha256sums=('23ecbba2235758ec5dd6d14bf1b76a5e642cc57d9f260c76db581d5ecdeddaaa'
            'd29ae49f54b9ba159fd39b0132dad6f0fa252902533934e7021f6cd61a04db33'
            'cc89dcb37e7f2dde624e8db706f0b26c0493fc68a1af5716b615ee992d716a84')

build() {
    cd "${srcdir}/pyrobbo-${pkgver}"
    python -m build --wheel --outdir "${srcdir}"
}

package() {
    cd "${srcdir}"
    python -m pip install --no-deps --ignore-installed --root="${pkgdir}" PyRobbo-${pkgver}-py3-none-any.whl
    mkdir -p "${pkgdir}/usr/share/applications"
    cp pyrobbo.desktop "${pkgdir}/usr/share/applications/"
    mkdir -p "${pkgdir}/usr/share/pixmaps"
    cp robbo.png "${pkgdir}/usr/share/pixmaps/"
}

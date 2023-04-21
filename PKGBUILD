pkgbase='python-mayavi'
pkgname=('python-mayavi')
_module='mayavi'
pkgver='4.8.1'
pkgrel=3
pkgdesc="3D scientific data visualization library and application"
url="http://docs.enthought.com/mayavi/mayavi/"
depends=('python'
         'vtk'
         'python-configobj'
         'python-apptools'
         'python-envisage'
         'verdict'
         'openxr'
         'mariadb-libs'
         'ospray'
         'openvr'
         'liblas'
         'cgns'
         'adios2'
         'libharu')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/${_module/-/_}-$pkgver.tar.gz"
        "mayavi-fixes.patch"
        "mayavi2.desktop"
        "mayavi2.png")
sha256sums=('9f427ef2ca6c91ae78d92d3689ba6beca24c8460e2706d8a1c9b84289ad3fd9e'
            '17f5b2d0cc8df43c045c216f090f9534e5f1766f9bacf4d3e9a6a3e422236fec'
            '560472153bfca1c1ca8fb05f8b6f4a40b9a08f9b0e0bc9763bcaf3058ca8ec56'
            'f54b39793087f3f9806b94ce5b410903e7dc49cd2a89287b6fd59f541f0aa14d')

prepare() {
    cd "${srcdir}/${_module}-${pkgver}"
    patch -p1 -i ../mayavi-fixes.patch
}

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 ../mayavi2.desktop "${pkgdir}/usr/share/applications/mayavi2.desktop"
    install -Dm644 ../mayavi2.png "${pkgdir}/usr/share/pixmaps/mayavi2.png"
}

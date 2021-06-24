pkgbase='python-kivy-garden-mapview'
pkgname=('python-kivy-garden-mapview')
_module='mapview'
pkgver='1.0.5'
pkgrel=2
pkgdesc="A kivy garden mapview demo."
url="https://github.com/kivy-garden/mapview"
depends=('python' 'python-kivy' 'python-requests')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz" "https://raw.githubusercontent.com/kivy-garden/mapview/develop/kivy_garden/mapview/icons/marker.png" "https://raw.githubusercontent.com/kivy-garden/mapview/develop/kivy_garden/mapview/icons/cluster.png" "icons.patch")
sha256sums=('c4f073c4cc0919b2411a354280473c3991838e79e15d11a4aa17023f270a3651'
            '6e1b5166457ea2fba447682b93db439edaca6b75f65b7e93ee6ba408e30afc79'
            '33b2c2c36c6c80d4604438a96939836a2e51dd2a4382af1186a637d75296b263'
            '7363f94df63be6e5f536d50b07d801a5b02abba8d405f8fa3d9e53285d5be720')

prepare() {
    cd "${srcdir}/${_module}-${pkgver}"
    mkdir -p kivy_garden/mapview/icons
    cp "${srcdir}/marker.png" kivy_garden/mapview/icons/
    cp "${srcdir}/cluster.png" kivy_garden/mapview/icons/
    patch --forward --strip=1 --input="${srcdir}/icons.patch"
}
            
build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

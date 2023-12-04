# Maintainer: Samuel Mesa <samuelmesa@gmail.com>
# based on script by: Johannes Löthberg <johannes@kyriasis.com>

pkgname=python-mapnik
pkgver=3.0.16
pkgrel=4

pkgdesc="Python3 bindings for Mapnik"
url="https://github.com/mapnik/python-mapnik"
arch=('any')
license=('LGPL')

depends=('python' 'mapnik' 'python-cairo' 'python-pyarrow' 'python-pypdf2')
makedepends=('python-setuptools')

source=("https://github.com/mapnik/python-mapnik/archive/v$pkgver.tar.gz"
          "package.patch"
          "proj6-syntax.patch"
          "no-distutils.patch"
          "boost1.71.patch")
sha1sums=('8e30049954b14282667677a5d5a145eddedfc8df'
          'b85f58f54a3353fbb51df79ea4d337f3b299cac7'
          'bf4118f8770c8a6ebfe144fbd8293c461de63ac8'
          '57272b7d7424c9f1b9650305738f46dd1d757348'
          '3a595137ebf04e96b18b672ce1aa0e20bcb72ee2')

prepare() {
    cd "$pkgname-$pkgver"
    rm "src/mapnik_svg_generator_grammar.cpp"
    patch --forward --strip=1 --input="${srcdir}/package.patch"
    patch --forward --strip=1 --input="${srcdir}/proj6-syntax.patch"
    patch --forward --strip=1 --input="${srcdir}/no-distutils.patch"
    patch --forward --strip=1 --input="${srcdir}/boost1.71.patch"
}

package() {
	echo "Proj4 support is enabled, but requires a mapnik version where this is enabled as well."
	cd python-mapnik-$pkgver
	export PYCAIRO_NO_IMPORT
	python setup.py install --root="$pkgdir" --optimize=1
}

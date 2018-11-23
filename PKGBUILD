pkgname=fuse-3ds
pkgver=1.3
pkgrel=1
pkgdesc="FUSE Filesystem Python scripts for Nintendo 3DS files"
arch=($CARCH)
license=(MIT)
url='https://github.com/ihaveamac/fuse-3ds'
makedepends=('python-setuptools' 'python-pycryptodomex')
options=(!strip)
source=("fuse-3ds-${pkgver}-src.zip::https://github.com/ihaveamac/fuse-3ds/releases/download/v${pkgver}/fuse-3ds-${pkgver}-src.zip")
sha256sums=('796bd5581a17985d48b5afc8f5074200b3eff1ba28218b403d36bc3a94a80111')
noextract=('fuse-3ds-${pkgver}-src.zip')

build() {
	unzip "${srcdir}/fuse-3ds-${pkgver}-src.zip" -d "${srcdir}/fuse-3ds"
	cd "${srcdir}/fuse-3ds"
	python setup.py build
}

package() {
	depends=('python>=3.6.1' 'python-pycryptodomex' 'fuse2')
	optdepends=('python-appjar: For fuse-3DS GUI')
	cd "${srcdir}/fuse-3ds"
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=qpid-proton
_pycname=python-$_pyname
pkgbase=$_pycname
pkgname=(python-$_pyname)
pkgver=0.35.0
pkgrel=1
pkgdesc="An AMQP based messaging library."
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="http://qpid.apache.org/proton/"
license=(Apache)
makedepends=(
	swig
	libsasl
	openssl
	python-setuptools
)
source=("https://pypi.io/packages/source/${_pycname::1}/${_pycname}/$_pycname-$pkgver.zip")
md5sums=('6339e97a9b8454abdb834241b0569bea')
sha256sums=('abafbedeaf6e138f8cba2bc871b7685c4fd156f3258cec17f253153ede18bbee')
sha512sums=('aaad12959c0c587eeacb07a0f435bdac85bb0d0577b496cc9fa813a625e3380bec57a4c987ad0ad0a1688c0137341c3d39b3d64b082e623c9f4496fd3fbe1a67')

build(){
	pushd $_pycname-$pkgver
	python setup.py build
	popd
}

_package_python(){
	depends=(
		libsasl
		openssl
		python
	)
	cd $_pycname-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 docs/* -t "$pkgdir"/usr/share/docs/$pkgname
}

eval "package_python-${_pyname}(){ _package_python; }"

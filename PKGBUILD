# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=gunicorn
pkgname=python-$_pyname
pkgver=20.1.0
pkgrel=1
pkgdesc="WSGI HTTP Server for UNIX"
arch=(any)
url="https://gunicorn.org/"
license=(MIT)
makedepends=(
	python
	python-setuptools
	python-sphinx
	python-sphinx_rtd_theme
)
checkdepends=(
	python-aiohttp
	python-gevent
	python-eventlet
	python-coverage
	python-pytest
	python-pytest-cov
)
optdepends=(
	python-gevent
	python-eventlet
	python-tornado
	python-gthread
	python-setproctitle
)
depends=(python)
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('db8a7c5c2064000af70286534803bf1d')
sha256sums=('e0a968b5ba15f8a328fdfd7ab1fcb5af4470c28aaf7e55df02a99bc13138e6e8')
sha512sums=('586c7373504b4018fd462dc9c728991a8cc9f2be71fc2fb5aa23707ff6157dd3953121f6a070cae64d58b10f9ddf77ad59b66ed33981d37919b4764c60609027')

build(){
	pushd $_pyname-$pkgver
	python setup.py build
	make -C docs man text
	popd
}

check(){
	pushd $_pyname-$pkgver
	python setup.py test
	popd
}

package(){
	cd "$_pyname-$pkgver"
	python setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
	install -Dm644 docs/build/text/* -t "$pkgdir"/usr/share/doc/$pkgname
	install -Dm644 docs/build/man/gunicorn.1 -t "$pkgdir"/usr/share/man/man1
}

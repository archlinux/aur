# Maintainer: wedjat <wedjat@protonmail.com>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=python-pydicom
pkgver=1.0.1
pkgrel=1
pkgdesc="Pure python package for working with DICOM files"
arch=("x86_64")
url="https://pydicom.github.io/pydicom/stable/index.html"
license=('MIT' 'custom')
depends=('python' 'python-numpy')
makedepends=('python-setuptools')
optdepends=()
options=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/pydicom/pydicom/archive/v$pkgver.tar.gz" "file://license.txt")
md5sums=('306ff7a9257a6d9e44ecf9b8c888c350'
         'dee3b5d8029934bd8195cd244b966055')

prepare() 
{
	cd "$srcdir/pydicom-$pkgver"
	sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python|"  $(find -name '*.py')
}

build() 
{
	cd "$srcdir/pydicom-$pkgver"
	python setup.py build
}

package() 
{
	cd "$srcdir/pydicom-$pkgver"
	python setup.py install --root="$pkgdir"/ --optimize=1

        install -D "$srcdir/pydicom-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

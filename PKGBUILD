# Maintainer: Dmitriy Geels <dmitriy dot geels at gmail dot com>

# Use the latest stable release of this Azure SDK component.
pkgname=python-azure-ai-documentintelligence
pkgver=1.0.2
pkgrel=2
pkgdesc='Microsoft Azure AI Document Intelligence Client Library for Python'
arch=(any)
url="https://github.com/Azure/azure-sdk-for-python"
license=(MIT)
depends=('python>=3.11' 'python-isodate>=0.6.1' 'python-azure-core>=1.30.0')
makedepends=(python-build python-installer python-wheel python-setuptools)
_ref=azure-ai-documentintelligence_1.0.2
_builddir=azure-sdk-for-python-azure-ai-documentintelligence_1.0.2/sdk/documentintelligence/azure-ai-documentintelligence
source=("azure-sdk-for-python-azure-ai-documentintelligence_1.0.2.tar.gz::https://github.com/Azure/azure-sdk-for-python/archive/refs/tags/$_ref.tar.gz"
        use-stdlib-typing.patch)
sha256sums=('2ef7568181c6c47cce53b50ccbc4e86d4fe8b444ea013c1471e92a02a9d89c9c'
            '21a44744c80126a5cb766fe13e066151f9f69d935175f27097cabfaa077b821a')

prepare(){
 cd "$srcdir/$_builddir"
 patch -Np1 -i "$srcdir/use-stdlib-typing.patch"
}

build(){
 cd "$srcdir/$_builddir"
 python -m build --wheel --no-isolation
}

package(){
 cd "$srcdir/$_builddir"
 python -m installer --destdir="$pkgdir" dist/*.whl
 install -Dm644 "$srcdir/azure-sdk-for-python-azure-ai-documentintelligence_1.0.2/sdk/documentintelligence/azure-ai-documentintelligence/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

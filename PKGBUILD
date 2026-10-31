# Maintainer: Dmitriy Geels <dmitriy dot geels at gmail dot com>
# Adapter version comes from its pyproject.toml in the latest monorepo release.
pkgname=python-llama-index-embeddings-ollama
pkgver=0.10.0
pkgrel=2
pkgdesc='llama-index embeddings ollama integration'
arch=(any)
url="https://github.com/run-llama/llama_index"
license=(MIT)
depends=(python 'python-ollama>=0.3.1' 'python-llama-index-core<0.15' 'python-llama-index-core>=0.13.0')
makedepends=(python-build python-installer python-wheel python-hatchling)
_ref=v0.14.25
_builddir=llama_index-0.14.25/llama-index-integrations/embeddings/llama-index-embeddings-ollama
source=("llama_index-v0.14.25.tar.gz::https://github.com/run-llama/llama_index/archive/refs/tags/$_ref.tar.gz"
        remove-pytest-asyncio-dependency.patch)
sha256sums=('52f0b6a4408e2efb8244172bc6beda9ca50f1ac35cdf8a0ee9c7103901b92a4b'
            '4ecf00a716c4ac017a7aa28fe9df2cc19f2e549330736292b4460679ed5d65a3')

prepare(){
 cd "$srcdir/$_builddir"
 patch -Np1 -i "$srcdir/remove-pytest-asyncio-dependency.patch"
}

build(){
 cd "$srcdir/$_builddir"
 python -m build --wheel --no-isolation
}

package(){
 cd "$srcdir/$_builddir"
 python -m installer --destdir="$pkgdir" dist/*.whl
 install -Dm644 "$srcdir/llama_index-0.14.25/llama-index-integrations/embeddings/llama-index-embeddings-ollama/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

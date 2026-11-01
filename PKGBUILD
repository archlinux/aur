# Maintainer: Dmitriy Geels <dmitriy dot geels at gmail dot com>
# Adapter version comes from its pyproject.toml in the latest monorepo release.
pkgname=python-llama-index-embeddings-openai-like
pkgver=0.4.0
pkgrel=2
pkgdesc='llama-index embeddings openai integration'
arch=(any)
url="https://github.com/run-llama/llama_index"
license=(MIT)
depends=(python 'python-llama-index-embeddings-openai<0.8' 'python-llama-index-embeddings-openai>=0.6.0')
makedepends=(python-build python-installer python-wheel python-hatchling)
_ref=v0.14.25
_builddir=llama_index-0.14.25/llama-index-integrations/embeddings/llama-index-embeddings-openai-like
source=("llama_index-v0.14.25.tar.gz::https://github.com/run-llama/llama_index/archive/refs/tags/$_ref.tar.gz"
        allow-openai-embeddings-0.7.patch)
sha256sums=('52f0b6a4408e2efb8244172bc6beda9ca50f1ac35cdf8a0ee9c7103901b92a4b'
            '131089d5c776a83778cddb1ce68423168b7436b202cc33a18800c58c4b6bbd78')

prepare(){
 cd "$srcdir/$_builddir"
 patch -Np1 -i "$srcdir/allow-openai-embeddings-0.7.patch"
}

build(){
 cd "$srcdir/$_builddir"
 python -m build --wheel --no-isolation
}

package(){
 cd "$srcdir/$_builddir"
 python -m installer --destdir="$pkgdir" dist/*.whl
 install -Dm644 "$srcdir/llama_index-0.14.25/llama-index-integrations/embeddings/llama-index-embeddings-openai-like/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Python package author: Tekky <<support@g4f.ai>>
# Maintainer: Qoqnus master <mahisokhary@gmail.com>
# Contributor: Magi3r <magier dot mit dot f3erball at gmail dot com>
pkgname=python-g4f
_name=g4f
pkgver=7.5.5
pkgrel=1
pkgdesc='The official gpt4free repository | various collection of powerful language models'
arch=('any')
url=https://github.com/xtekky/gpt4free
license=('GPL3')
depends=(
	'python-fastapi' 'uvicorn' 'python-curl_cffi' 'python-pillow' 'python-flask' 'python-markitdown' 'python-cryptography' 'python-dotenv'
	'python-pycryptodome' 'python-ddgs' 'python-beautifulsoup4' 'python-aiohttp-socks' 'python-numpy'
	'python-platformdirs' 'python-werkzeug' 'python-browser-cookie3' 'python-cairosvg' 'python-brotli' 'python-nest-asyncio' 'python-requests'
	'python-werkzeug' 'python-certifi' 'python-aiohttp' 'python-wasmtime' 'python-plyer' 'python-python-multipart' 'python-cloudscraper'
	'python-setuptools' 'python-gpt4all' 'python-pywebview' 'python-yaml' 'python-docx' 'python-aiofile' 'python-loguru' 'python-a2wsgi')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('56dc5bf4483bb5ca8a9876d1b9e0851d70323217d7e378293a18bb2c3d460b2a')

build() {
    cd $_name-$pkgver
    python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
    cd $_name-$pkgver
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl

    # Symlink license file
    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    install -d "$pkgdir"/usr/share/licenses/$pkgname
    ln -s "$site_packages"/$_name-$pkgver.dist-info/LICENSE \
       "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

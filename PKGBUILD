# Maintainer: ibrahimsql <ibrahimsql@proton.me>
pkgname=discoursemap
pkgver=1.2.2
pkgrel=1
pkgdesc="Discourse forum security scanner for security professionals and forum administrators"
arch=('any')
url="https://github.com/ibrahmsql/discoursemap"
license=('MIT')
depends=('python>=3.8' 'python-pip')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
optdepends=('python-pyyaml: YAML configuration support'
            'python-requests: HTTP library for API calls'
            'python-beautifulsoup4: HTML parsing'
            'python-lxml: XML/HTML processing'
            'python-colorama: Colored terminal output'
            'python-tqdm: Progress bars'
            'python-jinja2: Template engine'
            'python-urllib3: HTTP client library'
            'python-certifi: SSL certificate verification'
            'python-chardet: Character encoding detection'
            'python-idna: Internationalized domain names'
            'python-cryptography: Cryptographic operations'
            'python-pyopenssl: OpenSSL wrapper'
            'ruby-nokogiri: HTML/XML parsing for Ruby exploits'
            'ruby-json: JSON processing for Ruby exploits'
            'ruby-openssl: SSL/TLS support for Ruby exploits')
source=("https://files.pythonhosted.org/packages/source/d/discoursemap/discoursemap-${pkgver}.tar.gz")
sha256sums=('8df189ac1eed024fffd2ec73b6ec987b0e31446be642b33c7626bfc835701ffb')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    
    # Install license if exists
    if [ -f "LICENSE" ]; then
        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
    
    # Install documentation if exists
    if [ -f "README.md" ]; then
        install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    fi
    
    # Install configuration files if exists
    if [ -f "config.yaml" ]; then
        install -Dm644 config.yaml "$pkgdir/etc/$pkgname/config.yaml"
    fi
}
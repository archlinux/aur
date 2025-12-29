# Maintainer: rpupo63 <rpupo63@users.noreply.github.com>
pkgname=ai-rules-generator
pkgver=1.0.0
pkgrel=1
pkgdesc="A CLI tool that generates comprehensive AI coding agent rules for Cursor and Claude Code"
arch=('any')
url="https://github.com/rpupo63/ai-rules-generator"
license=('MIT')
depends=('python' 'python-setuptools')
optdepends=(
    'python-openai: For OpenAI provider support'
    'python-anthropic: For Anthropic Claude provider support'
)
makedepends=('python-build' 'python-installer' 'python-wheel')

# ============================================================================
# AUR PUBLISHING CONFIGURATION
# ============================================================================
source=("$pkgname-$pkgver.tar.gz::https://github.com/rpupo63/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl

    # Install license
    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

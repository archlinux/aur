# Maintainer: Arunachalam <arunachalam.gojosaturo@gmail.com>
# LUNA CLI - AI Coding Assistant for LUNA OS X

pkgname=luna-cli
pkgver=0.2.1
pkgrel=1
pkgdesc="🌙 LUNA - AI Coding Assistant CLI for LUNA OS X"
arch=('x86_64' 'aarch64')
url="https://github.com/Arunachalam-gojosaturo/Luna-cli"
license=('MIT')
depends=(
    'python>=3.10'
    'python-typer>=0.9'
    'python-rich>=13'
    'python-textual>=0.30'
    'python-prompt_toolkit>=3'
    'python-httpx>=0.24'
    'python-websockets>=11'
    'python-pydantic>=2'
    'python-dotenv>=1'
    'python-aiofiles>=23'
    'python-gitpython>=3.1'
    'python-colorama>=0.4'
    'python-shellingham>=1.5'
    'python-platformdirs>=3.10'
)
optdepends=(
    'groq: Groq AI provider support'
    'python-openai: OpenAI provider support'
    'python-google-generativeai: Google Gemini support'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://github.com/Arunachalam-gojosaturo/Luna-cli/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2cafcfc30ac7ee6e60abac226f283af9e73f04a3e7c1276752a0047bdc2923d1')

build() {
    cd "Luna-cli-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "Luna-cli-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    
    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 2>/dev/null || true
}

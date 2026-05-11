# Maintainer: badluma <tarmac_quarrel_7f@icloud.com>
pkgname=comprobot
pkgver=2.1.7
pkgrel=1
pkgdesc="A self-hostable Discord bot built for maximum customization."
arch=('any')
url="https://github.com/badluma/Comprobot"
license=('MIT')
depends=('python' 'python-pip')
makedepends=('python-build' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/c/comprobot/comprobot-${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "comprobot-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "comprobot-${pkgver}"
    pip install --root="$pkgdir" --prefix=/usr --no-deps dist/*.whl
    pip install --root="$pkgdir" --prefix=/usr discord.py[voice] python-dotenv requests tomlkit appdirs ollama google-genai groq InquirerPy
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

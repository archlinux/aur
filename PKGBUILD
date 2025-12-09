# Maintainer: Rubin Simons <me@rubin55.org>

pkgname=mistral-vibe
pkgver=1.0.3
pkgrel=1
pkgdesc='Minimal CLI coding agent by Mistral'
arch=('x86_64')
url='https://github.com/mistralai/mistral-vibe'
license=(Apache-2.0)
depends=(
    "python"
    #"python-agent-client-protocol"
    "python-aiofiles"
    "python-dotenv"
    "python-httpx"
    "python-mcp"
    "python-mistralai"
    "python-packaging"
    "python-pexpect"
    "python-pydantic"
    "python-pydantic-settings"
    "python-pyperclip"
    "python-pytest-xdist"
    "python-textual"
    "python-tomli-w"
    "python-watchfiles"
    "python-rich"
)
makedepends=(
    "pre-commit"
    "pyright"
    "python-build"
    "python-hatchling"
    "python-hatch-vcs"
    "python-installer"    
    "python-pytest"
    "python-pytest-asyncio"
    "python-pytest-textual-snapshot"
    "python-pytest-timeout"
    "python-respx"
    "ruff"
    "twine"
    "typos"
    "uv"
    "vulture"
)
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "vibe.sh"
)
sha256sums=('99980ec8e1988e27aa3aa168c9909c8dedef971e9c28e601eedb8bf6fb3cd5a2'
            '063773ff2dd0b2e95f9f61f91048ef90e28d4bb60d61005b9df1c15bbf3394d2')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    # Install scripts
    install -Dm755 "${srcdir}/vibe.sh" "${pkgdir}/usr/bin/vibe"
}

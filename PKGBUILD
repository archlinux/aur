# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=python-parllama
_pkgname=parllama
pkgver=0.9.2
pkgrel=2
pkgdesc="Terminal UI for Ollama and other LLM providers (Textual-based TUI)"
arch=('any')
url="https://github.com/paulrobello/parllama"
license=('MIT')
depends=('python' 'python-httpx' 'python-pillow' 'python-pydantic' 'python-dotenv' 'python-pytz' 'python-requests' 'python-rich' 'python-textual' 'python-orjson')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
optdepends=('python-litellm: soporte de proveedor LiteLLM' 'python-openai: proveedor OpenAI' 'python-anthropic: proveedor Anthropic' 'python-google-generativeai: proveedor Google/Gemini' 'python-langchain-openai: integración LangChain OpenAI' 'python-cryptography: cifrado del secrets vault')
_tag="v0.9.2"
_srcdir="parllama-0.9.2"
source=("$_pkgname-$pkgver.tar.gz::https://codeload.github.com/paulrobello/parllama/tar.gz/refs/tags/$_tag")
sha256sums=('2c2bb92eff73db90a658cb18c5d9138fc944f6edee332ac1263d8ffde8463de2')

build() {
	cd "$_srcdir"
	rm -rf dist
	python -m build --wheel --no-isolation
}

package() {
	cd "$_srcdir"
	python -m installer --no-compile --destdir="$pkgdir" dist/*.whl
	install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
	install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$_pkgname/CHANGELOG.md"
	install -Dm644 CONTRIBUTING.md "$pkgdir/usr/share/doc/$_pkgname/CONTRIBUTING.md"
	install -Dm644 project_design.md "$pkgdir/usr/share/doc/$_pkgname/project_design.md"
	install -Dm644 docs/reference/configuration.md "$pkgdir/usr/share/doc/$_pkgname/configuration.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

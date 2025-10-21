# Maintainer: username227
# Maintainer: ejedev <evan@ejedev.com>
# Contributor: Aloxaf <aloxafx@gmail.com>

_name=semgrep
pkgname=${_name}-bin
pkgver=1.140.0
pkgrel=1
pkgdesc="Lightweight static analysis for many languages. Find bug variants with patterns that look like source code."
arch=(x86_64)
url=https://github.com/returntocorp/semgrep
license=(LGPL-2.1-only)

makedepends=('python-pip' 'python-setuptools' 'python-wheel')
depends=(
  'python' 'python-attrs' 'python-boltons' 'python-click' 'python-click-option-group'
  'python-colorama' 'python-defusedxml' 'python-glom' 'python-jsonschema' 'python-packaging'
  'python-peewee' 'python-lsp-jsonrpc' 'python-requests' 'python-rich'  'python-ruamel-yaml'
  'python-tomli' 'python-typing_extensions' 'python-urllib3' 'python-wcmatch' 'python-pydantic'
  'python-opentelemetry-api' 'python-opentelemetry-exporter-otlp-proto-http' 'python-opentelemetry-sdk'
  'python-opentelemetry-instrumentation-requests' 'python-starlette' 'python-mcp' 'python-fastmcp'
)
optdepends=('jsonnet: experimental jsonnet support')
provides=('semgrep')

_b2sum="45f40d72ffb4573c4bbfcec2c31c5c519f43a2595b3855c30b3bed5f8e53a4f7"
_whl="semgrep-${pkgver}-cp310.cp311.cp312.cp313.cp314.py310.py311.py312.py313.py314-none-musllinux_1_0_${CARCH}.manylinux2014_${CARCH}.whl"
options=('!strip')
source=("https://files.pythonhosted.org/packages/${_b2sum:0:2}/${_b2sum:2:2}/${_b2sum:4}/${_whl}")
sha512sums=('974f53da41333e33b88d9e1e2c5fed50c3bd2811205c3d9d324f52e7440da5703299b1c6f0504e140bf937bc68d12724584680ce0ae04eeacda2a459e6eb2ad6')


package() {
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps "${_whl}"

  python -O -m compileall "${pkgdir}"
}

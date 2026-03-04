# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: username227
# Contributor: ejedev <evan@ejedev.com>
# Contributor: Aloxaf <aloxafx@gmail.com>

_name=semgrep
pkgname=${_name}-bin
pkgver=1.154.0
pkgrel=1
pkgdesc="Lightweight static analysis for many languages. Find bug variants with patterns that look like source code."
arch=('x86_64')
url="https://github.com/returntocorp/${_name}"
# _urlraw="https://raw.githubusercontent.com/returntocorp/${_name}/v${pkgver}"
_urlraw="https://raw.githubusercontent.com/returntocorp/${_name}/develop"
license=('LGPL-2.1-only')

makedepends=('python-pip' 'python-setuptools' 'python-wheel')
depends=(
  'python>=3.14' 'python-attrs' 'python-boltons' 'python-click' 'python-click-option-group'
  'python-colorama' 'python-defusedxml' 'python-glom' 'python-jsonschema' 'python-packaging'
  'python-peewee' 'python-lsp-jsonrpc' 'python-requests' 'python-rich'  'python-ruamel-yaml'
  'python-tomli' 'python-typing_extensions' 'python-urllib3' 'python-wcmatch' 'python-pydantic'
  'python-starlette' 'python-mcp' 'python-fastmcp' 'python-semantic-version' 'python-toml'
  'python-opentelemetry-api' 'python-opentelemetry-exporter-otlp-proto-http' 'python-opentelemetry-sdk'
  'python-opentelemetry-instrumentation-requests' 'python-opentelemetry-instrumentation-threading'
)
optdepends=('jsonnet: experimental jsonnet support')
provides=("${_name}")

_b2sum="a8dd5603d467a99bb6c2c50c5fae9dc8c52a1bb4f6d732746b4bc27bab42b337"
_whl="${_name}-${pkgver}-cp310.cp311.cp312.cp313.cp314.py310.py311.py312.py313.py314-none-musllinux_1_0_${CARCH}.manylinux2014_${CARCH}.whl"

options=('!strip')
noextract=("${_whl}")
source=("https://files.pythonhosted.org/packages/${_b2sum:0:2}/${_b2sum:2:2}/${_b2sum:4}/${_whl}"
        "README-${pkgver}.md::${_urlraw}/README.md"
        "LICENSE-${pkgver}::${_urlraw}/LICENSE")
sha512sums=('e5fd5450bdd8ec09e1425259e4d7bd3f273f511aee3bcb7ecf0395bc34bd7f5748f5bc410c40135274b07d8b4c1849aee0376984453fcf40386db552b6aab9cd'
            'd7f9da3fc18b50c4e5b8aa0dd4967c8ddfb97d7567988c700093afbb395fce7f2a3097cdf454a17e20a5fc4cb1898d00521604175e61ec96ec56044cfced1470'
            'dec798f85edac11b3a3f4bb1f309397719dd4de04f66357a5520b23e758cba757c9c7bee87bdbae2a5f936368cab0670bbd3395030393c029d68d0e72fcfba1e')


package() {
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="${pkgdir}" --ignore-installed --no-warn-script-location --root-user-action ignore --no-deps "${_whl}"

  python -O -m compileall "${pkgdir}"

  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

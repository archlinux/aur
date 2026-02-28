# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: username227
# Contributor: ejedev <evan@ejedev.com>
# Contributor: Aloxaf <aloxafx@gmail.com>

_name=semgrep
pkgname=${_name}-bin
pkgver=1.153.1
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

_b2sum="126da8dafc07ed41bdf92cb0d6b96f99013b88917e0d3cce4e5f86c341a3b8a8"
_whl="${_name}-${pkgver}-cp310.cp311.cp312.cp313.cp314.py310.py311.py312.py313.py314-none-musllinux_1_0_${CARCH}.manylinux2014_${CARCH}.whl"

options=('!strip')
noextract=("${_whl}")
source=("https://files.pythonhosted.org/packages/${_b2sum:0:2}/${_b2sum:2:2}/${_b2sum:4}/${_whl}"
        "README-${pkgver}.md::${_urlraw}/README.md"
        "LICENSE-${pkgver}::${_urlraw}/LICENSE")
sha512sums=('ab54e755974af87bfd583fc538d92cb8f537b91512200fddf2dfcde60be11247b0a761eb0b432fec1fc82cd15b1bd4f3648fbadbfc2b0a9ada0bd56c598ec05e'
            'd7f9da3fc18b50c4e5b8aa0dd4967c8ddfb97d7567988c700093afbb395fce7f2a3097cdf454a17e20a5fc4cb1898d00521604175e61ec96ec56044cfced1470'
            'dec798f85edac11b3a3f4bb1f309397719dd4de04f66357a5520b23e758cba757c9c7bee87bdbae2a5f936368cab0670bbd3395030393c029d68d0e72fcfba1e')


package() {
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="${pkgdir}" --ignore-installed --no-warn-script-location --root-user-action ignore --no-deps "${_whl}"

  python -O -m compileall "${pkgdir}"

  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

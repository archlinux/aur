# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: ejedev <evan@ejedev.com>
# Contributor: Aloxaf <aloxafx@gmail.com>
# Contributor: username227

_name=semgrep
pkgname=${_name}-bin
pkgver=1.166.0
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
  'python-colorama' 'python-glom' 'python-jsonschema' 'python-packaging' 'python-peewee'
  'python-lsp-jsonrpc' 'python-requests' 'python-rich'  'python-ruamel-yaml' 'python-tomli'
  'python-typing_extensions' 'python-urllib3' 'python-wcmatch' 'python-pydantic' 'python-starlette'
  'python-mcp' 'python-semantic-version' 'python-toml' 'python-opentelemetry-api' 'python-opentelemetry-sdk'
  'python-opentelemetry-instrumentation-requests' 'python-opentelemetry-instrumentation-threading'
)
optdepends=('jsonnet: experimental jsonnet support')
provides=("${_name}")

_b2sum="6a271779bcfeaddfff59c99e11d05776717862c2556343611d81c4f564b2f9ef"
_whl="${_name}-${pkgver}-cp310.cp311.cp312.cp313.cp314.py310.py311.py312.py313.py314-none-manylinux_2_34_${CARCH}.whl"

options=('!strip')
noextract=("${_whl}")

source=("https://files.pythonhosted.org/packages/${_b2sum:0:2}/${_b2sum:2:2}/${_b2sum:4}/${_whl}"
        "README-${pkgver}.md::${_urlraw}/README.md"
        "LICENSE-${pkgver}::${_urlraw}/LICENSE")
sha512sums=('2cf4077c8df5b1b4b140de6bfe67d5a9bfa2718022face0e9b9fa065d238ac832f89bae9a4b12a94fabe7343ccfcc476a518dd7ea6ac7625bad2a421de5713c7'
            '0add923c611511754f6c0baaa435e805cb3677fcb059af0bd867e2dda7c25525b9ff67da53975298ebf87f1265c8a2cf846adcf775d447e527874fc430b64551'
            'dec798f85edac11b3a3f4bb1f309397719dd4de04f66357a5520b23e758cba757c9c7bee87bdbae2a5f936368cab0670bbd3395030393c029d68d0e72fcfba1e')


package() {
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="${pkgdir}" --ignore-installed --no-warn-script-location --root-user-action ignore --no-deps "${_whl}"

  python -O -m compileall "${pkgdir}"

  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

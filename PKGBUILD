# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: ejedev <evan@ejedev.com>
# Contributor: Aloxaf <aloxafx@gmail.com>
# Contributor: username227

_name=semgrep
pkgname=${_name}-bin
pkgver=1.185.0
pkgrel=1
pkgdesc="Lightweight static analysis for many languages. Find bug variants with patterns that look like source code."

arch=('x86_64')
license=('LGPL-2.1-only')

url="https://github.com/${_name}/${_name}"
_urlraw="https://raw.githubusercontent.com/${_name}/${_name}/develop"

makedepends=('python-pip' 'python-setuptools' 'python-wheel')
depends=(
  'python>=3.14'
  'python-attrs'
  'python-boltons'
  'python-click'
  'python-click-option-group'
  'python-colorama'
  'python-glom'
  'python-jsonschema'
  'python-packaging'
  'python-peewee'
  'python-requests'
  'python-rich'
  'python-ruamel-yaml'
  'python-toml'
  'python-tomli'
  'python-typing_extensions'
  'python-urllib3'
  'python-wcmatch'
  'python-pydantic'
  'python-starlette'
  'python-mcp'
  'python-semantic-version'
  'python-opentelemetry-api'
  'python-opentelemetry-sdk'
  'python-opentelemetry-instrumentation-requests'
  'python-opentelemetry-instrumentation-threading'
)
optdepends=('jsonnet: experimental jsonnet support')
provides=("${_name}")

_b2sum="f2130d4dc8d124794105f300082c46e3d8ad45eac7af63113b57a5966629b5a3"
_whl="${_name}-${pkgver}-cp310.cp311.cp312.cp313.cp314.py310.py311.py312.py313.py314-none-manylinux_2_34_${CARCH}.whl"

options=('!strip')
noextract=("${_whl}")

source=("https://files.pythonhosted.org/packages/${_b2sum:0:2}/${_b2sum:2:2}/${_b2sum:4}/${_whl}"
        "README-${pkgver}.md::${_urlraw}/README.md"
        "LICENSE-${pkgver}::${_urlraw}/LICENSE")
sha512sums=('b5dd3a8e931098a41b0d540b75e70a6473d8f0966fb4669f90d82d142daf247207dcb29c36e091e74546e9c83d828ec721db699d5dec48c565aaec34cc3280c7'
            '53eb0ea0dcf2d9e578b6ba7913381c787cc29e3dc692774cd98ab0ae6b2fb4ceaaef7eab0b0dcade6c00b6629df3e9f6ddfa994d57bd1c728c3f3d792e2c3b60'
            'dec798f85edac11b3a3f4bb1f309397719dd4de04f66357a5520b23e758cba757c9c7bee87bdbae2a5f936368cab0670bbd3395030393c029d68d0e72fcfba1e')


package() {
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="${pkgdir}" --ignore-installed --no-warn-script-location --root-user-action ignore --no-deps "${_whl}"

  python -O -m compileall "${pkgdir}"

  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

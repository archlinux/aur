# Maintainer: Aditya Anil <aditya.anil.productions@gmail.com>
pkgname=agenttool
pkgver=0.2.0
pkgrel=1
pkgdesc="Terminal-based agentic coding assistant powered by local LLMs"
arch=('any')
url="https://github.com/aditya-an1l/AgentTool"
license=('Apache-2.0')
depends=(
  'python>=3.10'
  'python-openai'
  'python-ddgs'
  'python-rich'
  'python-prompt_toolkit'
  'python-requests'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Install the wheel
  python -m installer --destdir="${pkgdir}" dist/*.whl

  # Install agent.py as agenttool
  install -Dm755 agent.py "${pkgdir}/usr/bin/agenttool"

  # Install license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

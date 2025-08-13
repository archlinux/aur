# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=openai-agents
pkgname=python-${_name}
pkgver=0.2.6
pkgrel=1
pkgdesc="OpenAI Agents SDK."
arch=('any')
url='https://github.com/openai/openai-agents-python'
license=('MIT')
depends=('python' 'python-openai' 'python-pydantic' 'python-griffe' 'python-typing_extensions' 'python-requests' 'python-mcp')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-asyncio' 'python-pytest-mock' 'python-inline-snapshot' 'python-sounddevice' 'python-websockets' 'python-graphviz' 'python-fastapi' 'litellm')
optdepends=('python-numpy: voice' 'python-websockets: voice' 'python-graphviz: viz' 'litellm: litellm' 'python-websockets: realtime')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name/-/_}-$pkgver.tar.gz")
sha256sums=('39d11c77775aee1ab46045f40abbe0e36f39232fedc97fb3c309c1454c4d55cb')

build() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
  )
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  OPENAI_API_KEY=fake-for-tests pytest "${pytest_options[@]}" tests
}

package() {
  cd "${srcdir}"/${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# Maintainer: Billy Yang <me@venti.love>
_name=mcdreforged
pkgname=python-${_name}
pkgver=2.11.0
pkgrel=2
pkgdesc="A rewritten version of MCDaemon, a python script to control your Minecraft server"
arch=(any)
url="https://github.com/Fallen-Breath/MCDReforged"
license=('LGPL3')
depends=('python>=3.8' 'python-colorama' 'python-colorlog' 'python-parse' 'python-prompt_toolkit' 'python-psutil' 'python-requests' 'python-ruamel-yaml' 'python-typing_extensions')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
optdepends=('java-runtime: start Minecraft server')
options=()
install=
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('f7b8ac29efe16c9ff63b9180a9979aeaa0b8435f1df582ed2a0be717cec155b0')

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
}

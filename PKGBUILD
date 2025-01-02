# Maintainer: Billy Yang <me@venti.love>
_name=mcdreforged
pkgname=python-${_name}
pkgver=2.14.3
pkgrel=1
pkgdesc="A rewritten version of MCDaemon, a python script to control your Minecraft server"
arch=(any)
url="https://github.com/Fallen-Breath/MCDReforged"
license=('LGPL-3.0-or-later')
depends=('python>=3.8' 'python-colorama' 'python-colorlog' 'python-packaging' 'python-parse' 'python-prompt_toolkit' 'python-psutil' 'python-requests' 'python-resolvelib' 'python-ruamel-yaml' 'python-typing_extensions' 'python-wcwidth')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' )
optdepends=('java-runtime: start Minecraft server')
options=()
install=
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('7c45d6da800831f4426361ac20e58982c80ce508a89e7d646598f554e4c479f7')

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  cp LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"
}

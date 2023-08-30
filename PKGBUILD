# Maintainer: Billy Yang <handsomexdd1024@gmail.com>
_name=mcdreforged
pkgname=python-${_name}
pkgver=2.10.2
pkgrel=1
pkgdesc="A rewritten version of MCDaemon, a python script to control your Minecraft server"
arch=(any)
url="https://github.com/Fallen-Breath/MCDReforged"
license=('LGPL3')
depends=('python>=3.8' 'python-colorama' 'python-colorlog' 'python-parse' 'python-prompt_toolkit' 'python-psutil' 'python-requests' 'python-ruamel-yaml' 'python-typing_extensions')
makedepends=('python-build' 'python-installer' 'python-wheel')
optdepends=('java-runtime: start Minecraft server')
options=()
install=
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('1978fa954c3be27429dac53cad25a1df3b4b4cb6fe4b0fafcfbfb67e31d9695e')

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
}

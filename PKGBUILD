# Maintainer: jacopotediosi <jacopotediosi at gmail dot com>
# Maintainer: Yakov Till <yakov.till at gmail dot com>

_pkgname=frida
pkgname=python-$_pkgname-bin
pkgver=17.27.6
pkgrel=1

pkgdesc='Inject JavaScript to explore native apps on Windows, Mac, Linux, iOS and Android. Python 3 binary version from PyPi'
arch=('i686' 'x86_64' 'armv7l' 'aarch64')
url='https://www.frida.re'
license=('LicenseRef-wxWindows-3.1')
options=('!debug')

depends=('python')
makedepends=('python-installer')
optdepends=('python-typing_extensions: for Python <3.11'
            'rustup: for injecting Rust code into targets')
provides=("python-frida=$pkgver")
conflicts=('python-frida' 'python2-frida')

# Hashes updated by updpkgsums
sha256sums=('5ea1544b51a28bc823b03159190d4108f9fb4f4ef912389f5137c6d295e175b2')
sha256sums_i686=('b7d2482c0f1cbdc808bbcaa80065c93a0001e86c66a763c2c7735ceaab681962')
sha256sums_x86_64=('aad2981c671157968775d8e61fb33b7817b93c1fa443399a517575f9e4865bb0')
sha256sums_armv7l=('6165f39136185388e7f6fbea88009f0aa7cf25eb8e0d378faf7f2a1b6e3147b5')
sha256sums_aarch64=('039a0b967661d7452593b9eb915a308785ee54db04f2ea1f595cd36b4cae8cfd')

# Built distributions taken from https://pypi.org/project/frida/#files
_py=cp37
_abi=abi3
source=("frida-${pkgver}-COPYING::https://raw.githubusercontent.com/frida/frida/refs/tags/${pkgver}/COPYING")
source_i686=("https://files.pythonhosted.org/packages/$_py/${_pkgname::1}/$_pkgname/${_pkgname//-/_}-$pkgver-$_py-$_abi-manylinux_2_5_i686.whl")
source_x86_64=("https://files.pythonhosted.org/packages/$_py/${_pkgname::1}/$_pkgname/${_pkgname//-/_}-$pkgver-$_py-$_abi-manylinux_2_5_x86_64.whl")
source_armv7l=("https://files.pythonhosted.org/packages/$_py/${_pkgname::1}/$_pkgname/${_pkgname//-/_}-$pkgver-$_py-$_abi-manylinux_2_17_armv7l.whl")
source_aarch64=("https://files.pythonhosted.org/packages/$_py/${_pkgname::1}/$_pkgname/${_pkgname//-/_}-$pkgver-$_py-$_abi-manylinux_2_17_aarch64.whl")

latestver() {
  python - <<'PY'
import json
import urllib.request

with urllib.request.urlopen('https://pypi.org/pypi/frida/json') as response:
    print(json.load(response)['info']['version'])
PY
}

package() {
  cd "$srcdir"
  python -m installer --destdir="$pkgdir" "$srcdir"/*.whl

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m 644 "frida-${pkgver}-COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

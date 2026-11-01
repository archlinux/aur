# Maintainer: jacopotediosi <jacopotediosi at gmail dot com>
# Maintainer: Yakov Till <yakov.till at gmail dot com>

_pkgname=frida
pkgname=python-$_pkgname-bin
pkgver=17.25.1
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
sha256sums_i686=('e96d1d7840fb1d202438cc20831f1855bacea0a393d3203d3ee39f983b06e101')
sha256sums_x86_64=('45ce6f855006ce855991e0b43736016b61b020e3a7261cc74e0bccf88be0e383')
sha256sums_armv7l=('3e85e6c4894b49310b5f5ce073f457f9f9392ebc8d49692195ae91cb4889ec52')
sha256sums_aarch64=('4c987be6e54a317bb0f7e135b5abaf83303cd80f997ae201b29438e7931ad451')

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

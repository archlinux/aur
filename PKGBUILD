# Maintainer: jacopotediosi <jacopotediosi at gmail dot com>
# Maintainer: Yakov Till <yakov.till at gmail dot com>

_pkgname=frida
pkgname=python-$_pkgname-bin
pkgver=17.27.0
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
sha256sums_i686=('2a2f76e6b587ab2b90b74f590b1a6ad55f37d4791a0106d803eecd6726f31dc7')
sha256sums_x86_64=('041861b6e3037a0c22253acafb19ac9bb7b93423780ef93a190b4c1835d27bac')
sha256sums_armv7l=('748bdfc3bd44ca9de34acfd7f5b2bcac2f4ca918bd1ee14d31efac3ade55d87d')
sha256sums_aarch64=('93c54fe17ec3545f796d9868d33ba1537b41fe35343955daf94a843c9b02ca12')

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

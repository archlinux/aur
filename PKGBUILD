# Maintainer: Logan <3030994569@qq.com>

_pkgname=bt-dualboot-ng
_pyname=bt_dualboot_ng
pkgname=${_pkgname}
pkgver=2.1.1
pkgrel=1
pkgdesc="Sync Bluetooth pairing keys between dualboot Linux and Windows"
arch=('any')
url="https://github.com/awsl1414/bt-dualboot"
license=('MIT')
depends=('python' 'chntpw')
makedepends=('python-build' 'python-installer' 'python-hatchling')
source=('https://files.pythonhosted.org/packages/f6/22/b58e6114485a3fa7d5257d164f17ee7265d31cb7faaa317ba82c10a4f7b7/bt_dualboot_ng-2.1.1.tar.gz')
b2sums=('df82d8c51488d7f613dbe8339d0d1614de92b0ee8a2458fb180546b95107cfc6ef9aebfe44636fb94399c2f77f6f900c5aedfdf2e3935bd71015e76c03cb5b1b')

build() {
    cd "${srcdir}/${_pyname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pyname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" <<'EOF'
MIT License

Copyright (c) 2024 Konstantin Ivanov

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
EOF
}

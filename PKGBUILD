# Maintainer: Logan <3030994569@qq.com>

_pkgname=bt-dualboot-ng
_pyname=bt_dualboot_ng
pkgname=${_pkgname}
pkgver=2.1.2
pkgrel=1
pkgdesc="Sync Bluetooth pairing keys between dualboot Linux and Windows"
arch=('any')
url="https://github.com/awsl1414/bt-dualboot"
license=('MIT')
depends=('python' 'chntpw')
makedepends=('python-build' 'python-installer' 'python-hatchling')
source=("https://files.pythonhosted.org/packages/83/2a/f05096b724a9207068b8db0a740f94b7cca6b4745bbf5ead81102deeb4ab/bt_dualboot_ng-2.1.2.tar.gz")
b2sums=('43c27a54b7d80f6e0ada450baeedf337cceaaaae9d2a1d65619d561a693c9b419a35d71377ed23ad0244e9f03939cfa6c95cd37a89dfe43de3b97fc8ea273d7c')

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

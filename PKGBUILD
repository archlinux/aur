# Maintainer: Logan <3030994569@qq.com>

_pkgname=bt-dualboot-ng
_pyname=bt_dualboot_ng
pkgname=${_pkgname}
pkgver=2.0.1
pkgrel=1
pkgdesc="Sync Bluetooth pairing keys between dualboot Linux and Windows"
arch=('any')
url="https://github.com/awsl1414/bt-dualboot"
license=('MIT')
depends=('python' 'chntpw')
makedepends=('python-build' 'python-installer' 'python-hatchling')
source=("https://files.pythonhosted.org/packages/19/af/6d68dc435993d204f140c0b164cb96b2dad5427d86f304bb8c343eb91c72/${_pyname}-${pkgver}.tar.gz")
b2sums=('e02f9dff5b084a4352807dd636d42e0ca6b16efd7231963a1f50c25c57286a324750a33f5e2e853ef0d4af52005060f9844b7674c41ad3a9fb2bbfa9bb809306')

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

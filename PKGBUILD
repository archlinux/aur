# Copyright 2018 Google LLC

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#     http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Maintainer: David Wu <xdavidwuph@gmail.com>
# Contributor: Aleksey Filippov <sarum9in@gmail.com>
_pkgname=wheezy.template
pkgname=python-wheezy-0.1.167
pkgver=0.1.167
pkgrel=4
pkgdesc='A lightweight template library (0.1.167)'
arch=('any')
url="https://pypi.python.org/pypi/wheezy.template"
license=('MIT')
depends=('python')
makedepends=('python-setuptools') # when fallback to distutils /usr/bin/wheezy.template will be missing
provides=("python-wheezy=${pkgver}")
conflicts=(
    'python-wheezy'
    'python2-wheezy'  # /usr/bin/wheezy.template
)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('a2ee933452f0352fb8587d79bf6fc66dbf3a14779ef7d17b9fa75e80c0003f19')

build() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  chmod 644 "$pkgdir"/usr/lib/python3.*/site-packages/wheezy.template-0.1.167-py3.*.egg-info/*
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

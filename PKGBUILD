# Maintainer: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

pkgname=yaml-bindings-git
pkgver=r873.4548397
pkgrel=1
pkgdesc='Tooling for devicetree validation using YAML and jsonschema'
arch=(any)
url="https://github.com/devicetree-org/dt-schema"
license=('BSD')
depends=('python' 'python-ruamel-yaml' 'python-jsonschema' 'python-rfc3987' 'dtc')
makedepends=('python-setuptools' 'python-setuptools-scm' 'python-build' 'python-installer' 'python-wheel')
source=('yaml-bindings::git+https://github.com/devicetree-org/dt-schema.git')
sha1sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname%-git}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname%-git}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

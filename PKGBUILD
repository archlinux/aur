# Maintainer: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

pkgname=yaml-bindings-git
pkgver=r488.d4edb08
pkgrel=1
pkgdesc='Tooling for devicetree validation using YAML and jsonschema'
arch=(any)
url="https://github.com/devicetree-org/dt-schema"
license=('BSD')
depends=('python' 'python-ruamel-yaml' 'python-jsonschema' 'python-rfc3987')
makedepends=('python-setuptools')
source=('yaml-bindings::git+https://github.com/devicetree-org/dt-schema.git')
sha1sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname%-git}"
  python setup.py build
}

package() {
  cd "${pkgname%-git}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

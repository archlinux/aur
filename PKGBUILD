# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=pyfan
pkgver=2.0.0
pkgrel=2
pkgdesc='Fan control utilising hwmon and pid'
arch=(any)
url='https://somegit.dev/anonfunc/PyFan'
license=(GPL-3.0-or-later)
depends=(python python-yaml python-simple-pid)
makedepends=(git python-build python-installer python-wheel)
checkdepends=(python-pytest)
optdepends=('lm_sensors: check and load required hwmon modules')
source=("git+$url.git#tag=$pkgver")
b2sums=('cc92c8af65c8a5d0ba01ba01eab0869c342f5747d3224122dc5cb47f33a19d5ab9102690d61421e43730620aacc84128ce3c9e395d68f816248b279f9afdd7ac')

build() {
  cd PyFan
  python -m build --wheel --no-isolation
}

check() {
  cd PyFan
  PYTHONPATH=src pytest -vv
}

package() {
  cd PyFan
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 pyfan.service "$pkgdir"/usr/lib/systemd/system/pyfan.service
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
  install -Dm644 CHANGELOG.md "$pkgdir"/usr/share/doc/$pkgname/CHANGELOG.md
  install -Dm644 docs/configuration.md "$pkgdir"/usr/share/doc/$pkgname/configuration.md
  install -Dm644 config-example.yaml "$pkgdir"/usr/share/doc/$pkgname/config-example.yaml
}

# vim:set ts=2 sw=2 et:

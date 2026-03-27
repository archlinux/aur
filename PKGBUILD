# Maintainer: Mehad <mehad605@example.com>
pkgname=dev-type
pkgver=1.0.0
pkgrel=1
pkgdesc="Master touch typing while coding"
arch=('x86_64')
url="https://github.com/mehad605/dev_type"
license=('CC-BY-NC-SA-4.0')
depends=(
  'python'
  'python-pyside6'
  'python-pillow'
  'python-matplotlib'
)
makedepends=(
  'python-setuptools'
  'python-wheel'
)
source=("https://github.com/mehad605/dev_type/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ed4c3d4e5f736ed0fb48a56d033e932b78903a39bc4d8ad80128307374d62963')

build() {
  cd "dev_type-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "dev_type-${pkgver}"
  python -m pip install --root="${pkgdir}" --prefix=/usr --no-deps dist/*.whl

  install -Dm644 packaging/dev_type.desktop \
    "${pkgdir}/usr/share/applications/dev_type.desktop"

  install -Dm644 assets/icon.png \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/dev_type.png"

  install -Dm644 packaging/com.github.mehad605.dev_type.metainfo.xml \
    "${pkgdir}/usr/share/metainfo/com.github.mehad605.dev_type.metainfo.xml"
}

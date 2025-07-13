# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=pulldocker
pkgver=0.4.3
pkgrel=1
pkgdesc=" Watch git repositories for Docker compose configuration changes"
url="http://www.muflone.com/pulldocker"
arch=('any')
license=('GPL-3.0-or-later')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
depends=('python-gitpython' 'python-yaml')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/muflone/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('0d739349d6aa2591735009642387148905e1e0ae06027116effa0f5c7c24519a3fa84ba67ee2edad3eaea26aa1ca60a52d7a1e6bf05efeff04452d48914be68f')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  # Install icons
  _icons_dir="${pkgdir}/usr/share/icons/hicolor"
  for _size in 16 24 32 48 64 96 128 256 512
  do
    install -m 644 -D "icons/${_size}x${_size}/${pkgname}.png" "${_icons_dir}/${_size}x${_size}/apps/${pkgname}.png"
  done
  install -m 644 -D "icons/scalable/${pkgname}.svg" "${_icons_dir}/scalable/apps/${pkgname}.svg"
}


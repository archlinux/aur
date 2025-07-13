# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=pulldocker
pkgver=0.4.4
pkgrel=1
pkgdesc=" Watch git repositories for Docker compose configuration changes"
url="http://www.muflone.com/pulldocker"
arch=('any')
license=('GPL-3.0-or-later')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
depends=('python-gitpython' 'python-yaml')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/muflone/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('4c7bf3c3fae3a890b44e830c4e1c4bdaa3e7a53cb70c13c270f3d7047034dcb06c07d1002d345fde6a1789f74499587587bffb4db4bff217f43045c61bb3b726')

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


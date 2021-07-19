# Maintainer: Alex Wicks <alex@awicks.io> (https://aur.archlinux.org/account/aw1cks)
pkgname='csgo-handler'
_name='csgo_handler'
pkgver=1.1.2
pkgrel=0
pkgdesc='Daemon to run a program when CS:GO starts and stops'
arch=(any)
url="https://gitlab.com/aw1cks/${_name}"
license=('AGPL3')
groups=()
depends=(
  'python>=3.6'
  'python-configize'
  'python-daemon'
  'python-yaml'
  'python-inotify'
)
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
source=(
  "https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
  "${url}/-/raw/${pkgver}/systemd/${pkgname}.unit"
)
sha256sums=(
  '95e1cad10b2433d76390b423d8b3b4a39c6f5931ca3b5b1b9d489ad076c4803a'
  'd4c5935b6ad83b4f172421de186677e3ecbc151acb3a090ae837300df5f74b1b'
)

build() {
  cd "${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_name}-${pkgver}"
  export PYTHONHASHSEED=0
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  install -Dm644 "${srcdir}/${pkgname}.unit" "${pkgdir}/usr/lib/systemd/user/${pkgname}.service"
}

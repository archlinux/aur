# Maintainer: Yuval Adam <aur at yuv dot al> PGP-Key: 55E36E28535222E2A2062848B75B5FC2FA1AFE15

pkgname=greatfet-git
pkgver=v2018.12.1.60.g4c40233
pkgrel=1
pkgdesc="GreatFET firmware and host software"
arch=('any')
url="https://github.com/greatscottgadgets/greatfet"
license=(BSD)
depends=('ipython' 'python-pyusb' 'python-future' 'pygreat-git')
provides=('greatfet')
source=("git+${url}")
sha1sums=('SKIP')
install=greatfet-git.install
_gitname=greatfet

pkgver() {
  cd $_gitname
  echo $(git describe --always | sed 's/-/./g')
}

build() {
  cd "${_gitname}/host"
  python setup.py build
}

package() {
  cd "${_gitname}/host"
  install -D -m644 "${srcdir}/${_gitname}/host/misc/54-greatfet.rules" "${pkgdir}/usr/lib/udev/rules.d/54-greatfet.rules"
  python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

# vim:set ts=2 sw=2 et:

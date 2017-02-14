# Maintainer: Arne Beer <arne@twobeer.de>

_gitname=encarne
pkgname=${_gitname}-git
pkgver=0.1.2
pkgrel=1
arch=('any')
pkgdesc='A command scheduler for shells'
license=('MIT')
depends=('python-daemonize' 'python-terminaltables-git' 'python-colorclass-git' 'mediainfo' 'pueue' 'python-lxml')
makedepends=('git' 'python-setuptools')
provides=('encarne')
url='https://github.com/nukesor/encarne'
source=("git+https://github.com/nukesor/encarne.git")
sha256sums=('SKIP')

package() {
  cd "${_gitname}"

  # We don't need anything related to git in the package
  rm -rf .git*

  # Install
  python setup.py install --optimize=1 --root="${pkgdir}"

  # Place systemd user service
  install -Dm644 "utils/${_gitname}.service" "${pkgdir}/usr/lib/systemd/user/${_gitname}.service"

  # Install License
  # MIT/X11 license
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

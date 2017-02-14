# Maintainer: Arne Beer <arne@twobeer.de>

_gitname=pueue
pkgname=${_gitname}-git
pkgver='r123.f19b9b9'
pkgrel=1
arch=('any')
pkgdesc='A command scheduler for shells'
license=('MIT')
depends=('python-daemonize' 'python-terminaltables-git' 'python-colorclass-git')
conflicts=('pueue')
makedepends=('git' 'python-setuptools')
provides=('pueue')
url='https://github.com/nukesor/pueue'
source=("git+https://github.com/nukesor/pueue.git")
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

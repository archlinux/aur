# Maintainer:  twa022 <twa022 at gmail dot com>> 

_pkgname=mate-hud
pkgname=${_pkgname}-dev
_pkgver=22.04.4
pkgver=22.04.4+dev+56+a3ccbe5
pkgrel=1
pkgdesc="Run menubar commands, much like the unity 7 HUD (Development branch with new features)"
arch=('any')
url="https://github.com/twa022/mate-hud/tree/dev"
license=('GPL2')
depends=('rofi' 'python-gobject' 'mate-desktop' 'appmenu-gtk-module' 'python-pkgconfig'
         'dbus-python' 'python-psutil' 'python-setproctitle' 'python-xlib' 'python-pyinotify')
makedepends=('python-setuptools' 'python-distutils-extra' 'git' 'bc')
optdepends=('DBUS-PLOTINUS: plotinus backend')
provides=("${_pkgname}=${_pkgver}")
conflicts=("${_pkgname}")
_branch='dev'
_release_commit='8498847f9878cf96ba8231ae78f04604cce0f5e5'
source=("${_pkgname}::git+https://github.com/twa022/${_pkgname}#branch=${_branch}")
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	printf "%s+%s+%s+%s" \
	       "${_pkgver}" "${_branch}" \
	       "$( bc <<< "`git rev-list --count HEAD` - `git rev-list --count ${_release_commit}`" )" \
	       "$( git rev-parse --short HEAD )"
}

package() {
    cd "${_pkgname}"
    ./setup.py install --root="${pkgdir}" --optimize=1
}

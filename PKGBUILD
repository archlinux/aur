# Contributor: Baptiste Grenier <baptiste@bapt.name>
# Contributor: Pablo Olmos de Aguilera Corradini <pablo <at] glatelier (dot} org>
# Maintainer: Olivier Mehani <shtrom-aur@ssji.net>
pkgname=gtg-git
pkgver=1
pkgrel=1
pkgdesc="Personal GTD like organizer for the GNOME desktop environment. Git version."
url="http://gtgnome.net/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('pygtk' 'pygobject' 'python2-configobj' 'pyxdg' 'dbus-python'
'hicolor-icon-theme' 'desktop-file-utils' 'python2-gnomekeyring'
'python-liblarch-git')
makedepends=('bzr' 'python2-gconf')
optdepends=(
"python-bugz: for Bugzilla plugin"
"python-cheetah: for Export and print plugin"
"pdflatex: for Export and print plugin"
"pdftk: for Export and print plugin"
"pdfjam: for Export and print plugin"
"python-geoclue: for Geolocalized tasks plugin"
"python-clutter: for Geolocalized tasks plugin"
"python-clutter-gtk: for Geolocalized tasks plugin"
"python-champlain: for Geolocalized tasks plugin"
"python-champlain-gtk: for Geolocalized tasks plugin"
"hamster-time-tracker: for Hamster Time Tracker Integration to integrate with"
"python-appindicator: for Notification area plugin"
"python-dbus: for Tomboy/Gnote plugin"
"python-evolution: for Evolution synchronization service"
"python-dateutil: for Evolution and RememberTheMilk synchronization services"
"python-suds: for MantisBT synchronization service"
"python-launchpadlib: for Launchpad synchronization service"
)
conflicts=('gtg')
install="${pkgname}.install"
source=()
md5sums=()

_gitroot=https://github.com/getting-things-gnome/gtg
_gitname=${pkgname}

prepare() {
  cd "${srcdir}"
  msg "Connecting to GIT server...."

  if [[ -d "${_gitname}" ]]; then
    cd "${_gitname}" && git pull origin
    msg "The local files are updated."
  else
    git clone "${_gitroot}" "${_gitname}"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "${srcdir}/${_gitname}-build"
  git clone "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"
  cd "${srcdir}/${_gitname}-build"

  python setup.py build
}

package() {
  cd "${srcdir}/${_gitname}"
  python setup.py install --root=${pkgdir}
}

# vim:set ts=2 sw=2 et:

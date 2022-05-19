# Maintainer: Philip Wellnitz

pkgname=powerline-i3-git
_pkgname=powerline
pkgver=1.9.5.1
pkgrel=1
pkgdesc="The ultimate statusline/prompt utility. A fork containing more features for the i3 window manager."
arch=('i686' 'x86_64')
url="https://github.com/ph111p/powerline"
license=('MIT')
depends=(
  'python'
  'powerline-fonts'
  'ttf-font-awesome-4'
  'lemonbar-clicks-git'
  'i3ipc-python-git'
  'python-xlib'
)
optdepends=(
  'python-dbus: player segments using dbus, global menu support'
  'python-iwlib: wireless segment'
  'python-pyalsaaudio: volume segment'
  'python-psutil: cpu load segment'
  'python-pygit2: better git performance of the vcs segment'
  'python-google-api-python-client: Google Calendar support for the appoints segment'
  'xorg-xinput: screen rotation segment'
  'appmenu-qt4: global menu support in qt4 apps'
  'appmenu-gtk-module-git: global menu support in gtk apps'
  'libdbusmenu-glib: global menu support for chrome/chromium'
  'libdbusmenu-gtk3: global menu support for chrome/chromium'
  'libdbusmenu-gtk2: global menu support for chrome/chromium'
  'pygtk: global menu support'
  'python-gobject: global menu support'
)
makedepends=(
  'python-setuptools'
  'git'
)
provides=('powerline-i3')
conflicts=('powerline' 'python-powerline')

source=("git+https://github.com/ph111p/powerline.git#branch=develop")
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    echo $(git describe --abbrev=0 --tags).$(git rev-list --count $(git describe --abbrev=0 --tags)..HEAD)
}

package() {
    cd powerline

    python setup.py install --root="${pkgdir}" --optimize=1

    echo ">>> To use powerline instead of i3bar, replace"
    echo ">>>   bar {"
    echo ">>>      status_command i3status"
    echo ">>>   }"
    echo ">>> in your i3/config with this line:"
    echo ">>> exec_always \"killall powerline-lemonbar; powerline-lemonbar\""
}

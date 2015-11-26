# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Jean-Francois Chevrette <jfchevrette@gmail.com>
# Contributor: Jonathas Rodrigues <jonathas@archlinux.us>
# Contributor: Karl Kochs <captainhaggy@i2pmail.org>

pkgname=turpial-git
pkgver=3.0.r1647.2c44359
pkgrel=1
pkgdesc="A multi-interface Twitter client written in Python"
arch=(any)
url=http://turpial.org.ve/
license=(GPL3)
depends=('gstreamer0.10-python' 'hspell' 'libturpial-git' 'notification-daemon' 'python2-babel' 'python2-notify' 'python2-simplejson')
optdepends=(
    'pygtk>=2.12: GTK user interface'
    'aspell: GTK user interface'
    'gnome-spell: GTK user interface'
    'python2-gtkspell>=2.25.3: GTK user interface'
    'python2-pyqt4>=2.12: Qt user interface'
    'python2-jinja>=2.6: Qt user interface'
)
makedepends=(git python2-setuptools)
provides=(${pkgname%-*}=$pkgver)
conflicts=(${pkgname%-*})
source=($pkgname::git://github.com/satanas/Turpial.git#branch=development)
md5sums=('SKIP')

pkgver() {
    # TODO: with the next version bump, consider changing this to use `git describe`
    # see https://wiki.archlinux.org/index.php/VCS_package_guidelines#Git
    cd $pkgname/
    echo $(head -n1 ChangeLog | awk '{print $1}' | sed 's/v//;s/-/./').r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
    cd $pkgname/
    python2 setup.py build || return 1
}

package() {
    cd $pkgname/
    python2 setup.py install --root="$pkgdir/" --optimize=1 || return 1
}

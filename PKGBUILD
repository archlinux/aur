# Maintainer: James An <james@jamesan.ca>
# Contributor: katanasov <pranayama111@gmail.com>

_pkgname=evolution-on
pkgname="$_pkgname-git"
pkgver=v3.12.3.r1.g9a914c9
pkgrel=1
pkgdesc='Plugin to put evolution in system tray.'
arch=('i686' 'x86_64')
url="https://github.com/KostadinAtanasov/$_pkgname"
license=('GPL')
depends=('evolution>=2.30' 'gconf' 'libnotify')
makedepends=('git' 'autoconf>=2.53' 'automake>=1.8''libtool>=1.4.3' 'glib2>=2.2.0' 'pkgconfig>=0.14.0' 'intltool>=0.25' 'gnome-common>=2.3.0')
provides=("$_pkgname")
conflicts=("$_pkgname" 'evolution-tray' 'evolution-tray-arch')
replaces=('evolution-tray' 'evolution-tray-arch')
install="$pkgname.install"
source=("$_pkgname"::"git+https://github.com/KostadinAtanasov/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    (
        set -o pipefail
        git describe --long --tag | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "$_pkgname"
    ./autogen.sh --prefix=/usr
    make
}

package() {
    cd "$_pkgname"
    make DESTDIR="$pkgdir/" install
}

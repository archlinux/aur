# Maintainer: Kai Muenz <kai+archlinux@muenz.net>
_pkgname=odr-encodermanager
pkgname=$_pkgname-git
pkgver=5.0.0.r279.9b6cf19
pkgrel=1
pkgdesc="Opendigitalradio WebGUI for ODR Encoder"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/Opendigitalradio/$_pkgname"
license=('GPL')
groups=('ODR')
depends=('odr-audioenc' 'odr-sourcecompanion' 'odr-padenc')
makedepends=('python-cherrypy' 'python-jinja' 'python-pyserial' 'python-yaml' 'supervisor' 'python-pysnmp')
checkdepends=()
optdepends=()
provides=("$_pkgname" "$pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "$(git describe --tags | sed 's|-|.|g' | sed 's/v//g').r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$_pkgname"
    mkdir -p "$pkgdir"/opt/"$_pkgname"
    cp -r "$srcdir"/"$_pkgname"/* "$pkgdir"/opt/"$_pkgname"/
#    mv "$pkgdir"/opt/"$_pkgname"/supervisor-encoder.conf "$pkgdir"/opt/"$_pkgname"/supervisor-encoder.conf.sample # Doesnt exist?
    mv "$pkgdir"/opt/"$_pkgname"/supervisor-gui.conf "$pkgdir"/opt/"$_pkgname"/supervisor-gui.conf.sample
    mkdir -p "$pkgdir"/etc/$_pkgname
    cp "$srcdir"/"$_pkgname"/config.json.sample "$pkgdir"/etc/$_pkgname/config.json
    mkdir -p "$pkgdir"/etc/supervisor/conf.d
#    cp "$srcdir"/"$_pkgname"/supervisor-encoder.conf "$pkgdir"/etc/supervisor/conf.d/odr-encoder.conf  # Doesnt exist?
    cp "$srcdir"/"$_pkgname"/supervisor-gui.conf "$pkgdir"/etc/supervisor/conf.d/odr-gui.conf
}

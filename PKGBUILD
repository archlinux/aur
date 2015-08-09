# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Louis des Landes <psyker7 at gmail dot com>

pkgname=libturpial-git
pkgver=1.7.0.602.3de626f
pkgrel=1
pkgdesc="A library that handles multiple microblogging protocols."
arch=(any)
url=http://turpial.org.ve/
license=(GPL3)
depends=(python2-oauth python2-requests python2-simplejson)
makedepends=(git python2-setuptools)
provides=(${pkgname%-*}=$pkgver)
conflicts=(${pkgname%-*})
source=($pkgname::git://github.com/satanas/libturpial.git#branch=development)
md5sums=('SKIP')

pkgver() {
    # TODO: with the next version bump, consider changing this to use `git describe`
    # see https://wiki.archlinux.org/index.php/VCS_package_guidelines#Git
    cd $pkgname/
    echo $(head -n1 ChangeLog | awk '{print $1}' | sed 's/v//;s/-/./').$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
    cd $pkgname/
    python2 setup.py build || return 1
}

package() {
    cd $pkgname/
    python2 setup.py install --root="$pkgdir/" --optimize=1 || return 1
    rm "$pkgdir"/usr/{AUTHORS,COPYING,ChangeLog}
}

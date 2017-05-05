# Maintainer: Xinkai Chen <xinkai.chen@qq.com>

_pkgname="apw"
pkgname="${_pkgname}-git"
pkgver=20170506.7c36821
pkgrel=1
epoch=
pkgdesc="Watch repo changes"
arch=("any")
url="https://www.github.com/Xinkai/ArchPackageWatcher"
license=('GPL')
depends=("nodejs" "expac")
makedepends=("npm")
source=($_pkgname::git+https://github.com/Xinkai/ArchPackageWatcher.git)
md5sums=('SKIP')
install="apw.install"

pkgver() {
        cd "${srcdir}/${_pkgname}"
        git log -1 --format='%cd.%h' --date=short | tr -d -
}

package() {
    cd $srcdir/$_pkgname
    npm install -g --user root --prefix "$pkgdir"/usr
    chmod -R go-w "$pkgdir"/usr 

    mkdir -p $pkgdir/usr/lib/systemd/user
    install $srcdir/${_pkgname}/src/systemd/apw.{service,timer} $pkgdir/usr/lib/systemd/user

    mkdir -p $pkgdir/usr/bin
    ln -s /usr/lib/node_modules/apw/src/main.js $pkgdir/usr/bin/apw

    rm -rf $pkgdir/usr/etc
}


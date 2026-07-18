# Maintainer: Zhang Hua <zhanghua.00 at qq dot com>

pkgname=ariang-git
pkgver=1.3.14.r1.gd6a7653
pkgrel=2
pkgdesc="a modern web frontend making aria2 easier to use."
arch=("any")
url="https://github.com/mayswind/AriaNg"
license=("MIT")
makedepends=("git" "npm" "gulp" "openssh")
optdepends=(
    "aria2: if you use ariang locally"
    "apache: for web server"
    "caddy: for web server"
    "lighttpd: for web server"
    "nginx: for web server")
provides=("ariang")
conflicts=("ariang")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver(){
    cd "${srcdir}/AriaNg"
    git describe --tags --long | sed 's/v//;s/-/.r/;s/-/./g'
}
build(){
    cd "${srcdir}/AriaNg"
    export npm_config_allow_git=all
    npm install
    npm run build
}
package(){
    cd "${srcdir}/AriaNg"
    mkdir -p "${pkgdir}/usr/share/webapps"
    cp -av dist "${pkgdir}/usr/share/webapps/ariang"
}

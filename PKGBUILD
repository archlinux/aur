# Maintainer: Zhang Hua <zhanghua.00 at qq dot com>

pkgname=ariang-git
pkgver=1.3.3.r0.g17e7714
pkgrel=1
pkgdesc="a modern web frontend making aria2 easier to use."
arch=("any")
url="https://github.com/mayswind/AriaNg"
license=("MIT")
makedepends=("git" "nodejs" "gulp" "openssh")
optdepends=(
    "aria2: if you use ariang locally"
    "apache: for web server"
    "caddy: for web server"
    "lighttpd: for web server"
    "nginx: for web server")
provides=("ariang")
conflicts=("ariang")
source=(
    "git+${url}.git"
    "ariang-post-install.hook")
sha256sums=('SKIP'
            'ceb1903822653f6ef5c10b2ec19287a4d7fc6afa3854784015b53b61b12fd62f')

pkgver(){
    cd "${srcdir}/AriaNg"
    git describe --tags --long | sed 's/v//;s/-/.r/;s/-/./g'
}
build(){
    cd "${srcdir}/AriaNg"
    node /usr/lib/node_modules/corepack/dist/pnpm.js install
    gulp clean build
}
package(){
    cd "${srcdir}/AriaNg"
    mkdir -p "${pkgdir}/usr/share"
    cp -av dist "${pkgdir}/usr/share/ariang"
    install -Dm644 "${srcdir}/ariang-post-install.hook" \
        "${pkgdir}/usr/share/libalpm/hooks/ariang.hook"
}

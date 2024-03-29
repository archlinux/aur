# Maintainer: Zhang Hua <zhanghua.00 at qq dot com>

pkgname=ariang-git
pkgver=1.3.7.r2.g5c47d61
pkgrel=1
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
source=(
    "git+${url}.git"
    "ariang-post-install.hook")
sha256sums=('SKIP'
            '52424300b6227eb28641f77bbd6ff67f4a3114e515c66dac650382f842f5c07e')

pkgver(){
    cd "${srcdir}/AriaNg"
    git describe --tags --long | sed 's/v//;s/-/.r/;s/-/./g'
}
build(){
    cd "${srcdir}/AriaNg"
    npm install
    npm run build
}
package(){
    cd "${srcdir}/AriaNg"
    mkdir -p "${pkgdir}/usr/share/webapps"
    cp -av dist "${pkgdir}/usr/share/webapps/ariang"
    install -Dm644 "${srcdir}/ariang-post-install.hook" \
        "${pkgdir}/usr/share/libalpm/hooks/ariang.hook"
}

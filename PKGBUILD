# Maintainer: Mani Zaeim <mani.zaeim@gmail.com>
# Contributor: slithery, Lone_Wolf, Eschwartz <eschwartz@archlinux.org>
#Special Thanks to the contributors who helped me to make thins PKGBUILD
pkgname="super-productivity"
pkgver=1.5.2
pkgrel=1
epoch=1
pkgdesc="To Do List / Time Tracker with Jira Integration. Makes you super productive!"
arch=('x86_64')
url="http://www.super-productivity.com"
license=('MIT')
provides=('super-productivity')
options=(!strip)
makedepends=('npm' 'electron' 'gyp-git' 'gulp' 'bower')
source=("https://github.com/johannesjo/super-productivity/archive/v$pkgver.tar.gz")
md5sums=('998485e4eeb3b7e1fbe54b64a79d28d0')

package() {
    tar -xvf "v$pkgver.tar.gz"
    cd "$srcdir/$pkgname-$pkgver"
    npm install -g --user root --prefix "$pkgdir"/usr
    npm install --cache "${srcdir}/npm-cache"
    npm install && bower install --allow-root
    gulp build
    
    for size in 22 24 32 48 64 128 256 512; do
        install -Dm644 "app-src/img/icon_128x128.png" "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$pkgname.png"
    done
    
    echo "[Desktop Entry]\nName=superProductivity\nComment=Personal Task Management App to help you with your daily struggle with JIRA etc.\nExec=AppRun\nTerminal=false\nType=Application\nIcon=superproductivity\nX-AppImage-Version=$pkgver\nCategories=Utility;" > $pkgname.desktop
    mkdir -p "$pkgdir"/usr/share/applications/
    install -Dm644 "$pkgname".desktop "$pkgdir"/usr/share/applications/
    install -Dm644 "${srcdir}/$pkgname-$pkgver/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}


# Maintainer: AraneusRota

pkgname=krunner-watch-git
_pkgname=${pkgname%-git}
_reponame=krunner-restarter
pkgver=r1.95d3cfd
pkgrel=1
pkgdesc="A temporary solution for krunner on nvidia driver by scanning logs for eglSwapBuffers errors (Also called: krunner-restarter)"
arch=('any')
url="https://github.com/kpostekk/krunner-restarter"
depends=('krunner' 'qt5-tools')
makedepends=('git')
source=("git+https://github.com/kpostekk/krunner-restarter.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_reponame"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir"
    sed -i 's/\/usr\/local\/bin\/krunner-watch/\/usr\/bin\/krunner-watch/g' "$_reponame/krunner-watch.service"
}

package() {
    cd "$srcdir"

    install -D -m755 "$_reponame/${_pkgname}.sh" "$pkgdir/usr/bin/${_pkgname}"
    install -Dm644 "$_reponame/${_pkgname}.service" "$pkgdir/usr/lib/systemd/user/${_pkgname}.service"
}

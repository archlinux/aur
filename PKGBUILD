# Maintainer: Jesse Bryan <jesse@winneon.moe>
pkgname=watch-with-mpv-git
_pkgname=watch-with-mpv
pkgver=20170923.598067b
pkgrel=1
pkgdesc="The native host for the Watch with MPV Chrome extension."
arch=("any")
url="https://github.com/winneon/${pkgname}"
license=("GPL2")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=("mpv>=1:0.27.0" "youtube-dl>=2017.08.06")
makedepends=("git" "nodejs" "npm")
options=("!strip") # Required to keep the packaged node binary intact.
source=("${pkgname}::git+https://github.com/winneon/watch-with-mpv.git")
sha256sums=("SKIP")

pkgver() {
    cd "${pkgname}"
    git log -1 --format="%cd.%h" --date=short | tr -d -
}

build() {
    cd "${pkgname}/native"
    npm install --cache "${srcdir}/npm-cache"
    npm run build
}

package() {
    cd "${pkgname}/native/build/linux"
    make DESTDIR="${pkgdir}" install
}

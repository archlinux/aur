# Maintainer: kumax <kumax2048@pm.me>
pkgname=firefox-extension-listen1-git
pkgver=r504.4eed624
pkgrel=1
pkgdesc="One for all free music in China"
arch=("any")
url="https://listen1.github.io/listen1"
_githuburl="https://github.com/listen1/listen1_chrome_extension"
_name=${_githuburl##*/}
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
license=('MIT')
depends=("firefox")
makedepends=("git" "zip")
source=("git+${_githuburl}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_githuburl##*/}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
    cd "${srcdir}/${_githuburl##*/}" || exit
    mv manifest_firefox.json manifest.json
}

build() {
    cd "${srcdir}/${_githuburl##*/}" || exit
    zip -r "${srcdir}"/githublisten1@gmail.com.xpi ./*
}

package() {
    install -Dm644 githublisten1@gmail.com.xpi "${pkgdir}"/usr/lib/firefox/browser/extensions/githublisten1@gmail.com.xpi
}

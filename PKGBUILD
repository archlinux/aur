# Maintainer: Bar Yemini <bar.ye651@gmail.com>
pkgname=osume-git
_pkgname=${pkgname%-git}
pkgver=0.1.0.r1.g2d06485
pkgrel=1
pkgdesc="Extract music from osu!lazer beatmaps"
url="https://github.com/bbb651/${_pkgname}"
arch=('any')
license=('GPL3')
depends=('python' 'python-mutagen' 'python-inquirer' 'python-tqdm')
makedepends=('git')
conflicts=("${_pkgname}")
source=("$_pkgname::git+https://github.com/bbb651/$_pkgname.git#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    local _version="$(git describe --long --tags | sed -e 's/-/.r/' -e 's/-/./')"
    printf "${_version#v}"
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 osume.py "$pkgdir/usr/bin/osume"
}

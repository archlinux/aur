# Maintainer: Kars Wang <jaklsy AT gmail.com>

pkgname='aria-ng-git'
_pkgname='aria-ng'
pkgver=r285.2e18f58
pkgrel=1
pkgdesc='AriaNg, A Better Web Frontend for aria2 (a cross-platform download utility).'
arch=(any)
url='https://github.com/mayswind/AriaNg'
license=('MIT')
depends=('aria2')
makedepends=('git' 'npm' 'bower' 'gulp')
provides=('aria-ng-git')
conflicts=('aria-ng-git')

source=(
  "${_pkgname}::git+https://github.com/mayswind/AriaNg.git"
  'apache.example.conf'
  'nginx.example.conf'
  "$pkgname.install"
)

sha256sums=(
  'SKIP'
  '43feb0312822646cbba20850dbade93a0a9241696ff17bc8c5767f752cb12cc2'
  'c03411b9cc27fc1a8e4dfe8a8a4c5ce67b0a35abbfaff10d20a7faa692dfb617'
  '7308ee5a035047c74ee5def138a0f40b6e65cf548f6a392bd00773ab20449158'
)

install=$pkgname.install

pkgver() {
    cd "${srcdir}/${_pkgname}"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}"

    npm install
    bower install
    gulp clean build
}

package() {
    cd "${srcdir}/${_pkgname}"

    mkdir -p "$pkgdir/usr/share"
    cp -r dist "$pkgdir/usr/share/$_pkgname"

    mkdir -p "$pkgdir/etc/$_pkgname"
    cp ../*.example.conf "$pkgdir/etc/$_pkgname"

    chown http:http -R "$pkgdir/usr/share/$_pkgname"
}

# vim:set ts=2 sw=2 et:


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
  '66ec82974d11c30348df6ea705702fb569e9a6ca5ada8ca64445557468106148'
  'c03411b9cc27fc1a8e4dfe8a8a4c5ce67b0a35abbfaff10d20a7faa692dfb617'
  'c78e65e21d604dac4f0aa097006d5f81a487ddcf5f14dedad07ec11c6df9e79c'
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


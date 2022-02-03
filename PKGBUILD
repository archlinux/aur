# Maintainer: Galen Guyer <galen@galenguyer.com>
pkgname='hancock-git'
_gitname=hancock
pkgver=2022.02.02_40
pkgrel=1
description='A simple x509 certificate manager (git version)'
arch=('any')
url='https://github.com/galenguyer/hancock'
license=('MIT')
makedepends=('git' 'go')
source=('git+https://github.com/galenguyer/hancock')
sha256sums=('SKIP')

pkgver() {
    cd ${_gitname}
    _commits=$(git rev-list --count HEAD) # total commits is the most sane way of getting incremental pkgver
    _date=$(git log -1 --date=short --pretty=format:%cd)
    printf "%s_%s\n" "${_date}" "${_commits}" | sed 's/-/./g'
}


prepare() {
    cd "$_gitname"
    mkdir -p build/
}

build () {
    cd "$_gitname"
    go build -o build/
}

package () {
    cd "$_gitname"
    install -Dm755 build/$_gitname "$pkgdir"/usr/bin/$_gitname
}

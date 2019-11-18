# Maintainer: JunYoung Gwak <aur@jgwak.com>

_gitname=irslackd
pkgname=${_gitname}-git
pkgver=r155.9aaf4e4
pkgrel=1
pkgdesc='A self-hosted IRC gateway to Slack'
arch=('any')
license=('Apache')
url="https://github.com/adsr/irslackd"
depends=('nodejs')
makedepends=('npm' 'git')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd ${_gitname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}"
  tar -czf ${_gitname}.tar.gz ${_gitname}
}

package() {
    cd "${srcdir}/${_gitname}"
    npm install --cache ../cache --user root -g --prefix "${pkgdir}/usr" ../*.tar.gz
}

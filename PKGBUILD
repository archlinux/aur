# Maintainer: Steffen Fritz <aur AT fritz DOT wtf>
pkgname=pacaudit
pkgver=0.2
pkgrel=1
pkgdesc="This package audits installed packages against known vulnerabilities. Use after pacman -Syu."
arch=('i686' 'x86_64')
url="https://github.com/steffenfritz/pacaudit"
license=('GPL3')
depends=('glibc')
makedepends=('go')
options=('!strip')

validpgpkeys=('7328F6E376924E4EE266381D3D9C808E038A615C')
sha256sums=('9c624a3b1df9ca3fdb14efafdb352f273faa6c7f990161681d51c629a6f995f7'
'7d5f5453b683868699e8d665f566c087d3cc939e486c3ed3a1fa04747c0fee3d')

source=("https://github.com/steffenfritz/pacaudit/archive/v$pkgver.tar.gz" "https://fritz.wtf/v$pkgver.tar.gz.asc")

build() {
    cd pacaudit-$pkgver
    go build -o pacaudit -ldflags "-s -w"
}

package() {
    install -Dm755 "$srcdir"/pacaudit-$pkgver/pacaudit "$pkgdir"/usr/bin/pacaudit
}

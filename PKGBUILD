# Maintainer: Steffen Fritz <aur AT fritz DOT wtf>
pkgname=pacaudit
pkgver=0.1
pkgrel=2
pkgdesc="This package audits installed packages against known vulnerabilities. Use after pacman -Syu."
arch=('i686' 'x86_64')
url="https://github.com/steffenfritz/pacaudit"
license=('GPL3')
depends=('glibc')
makedepends=('go')
options=('!strip')

validpgpkeys=('7328F6E376924E4EE266381D3D9C808E038A615C')
sha256sums=('c1e4725db43542d240c25a47a55a2f4586a0a49da12e7956368d40e9454f3816'
'f2911b7c218bfc4c0f4509983f887fc851bf21cbe0f7ffdf6a9f1061d66559cf')

source=("https://github.com/steffenfritz/pacaudit/archive/v$pkgver.tar.gz" "https://fritz.wtf/v$pkgver.tar.gz.asc")

build() {
    cd pacaudit-$pkgver
    go build -o pacaudit -ldflags "-s -w"
}

package() {
    install -Dm755 "$srcdir"/pacaudit-$pkgver/pacaudit "$pkgdir"/usr/bin/pacaudit
}

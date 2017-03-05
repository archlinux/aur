# Maintainer: Steffen Fritz <aur AT fritz DOT wtf>
pkgname=pacaudit
pkgver=0.3.1
pkgrel=1
pkgdesc="This package audits installed packages against known vulnerabilities. Use after pacman -Syu."
arch=('i686' 'x86_64')
url="https://github.com/steffenfritz/pacaudit"
license=('GPL3')
makedepends=('go')
options=('!strip')

validpgpkeys=('7328F6E376924E4EE266381D3D9C808E038A615C')
sha256sums=('977ff963384360cf1646e26e2e0777312613edeaea622dd4e184791c4bdb3f0e'
'214484bdf4bab2e5be27bf8889cd9196838334cc8b5cadbdc7d6c5a918440692')

source=("https://github.com/steffenfritz/pacaudit/archive/v$pkgver.tar.gz" "https://fritz.wtf/v$pkgver.tar.gz.asc")

build() {
    cd pacaudit-$pkgver
    go build -o pacaudit -ldflags "-s -w"
}

package() {
    install -Dm755 "$srcdir"/pacaudit-$pkgver/pacaudit "$pkgdir"/usr/bin/pacaudit
    install -Dm644 "$srcdir"/pacaudit-$pkgver/pacaudit.1 "${pkgdir}/usr/share/man/man1/pacaudit.1"
}

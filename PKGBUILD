# Maintainer: Steffen Fritz <aur AT fritz DOT wtf>
pkgname=pacaudit
pkgver=0.3.0
pkgrel=1
pkgdesc="This package audits installed packages against known vulnerabilities. Use after pacman -Syu."
arch=('i686' 'x86_64')
url="https://github.com/steffenfritz/pacaudit"
license=('GPL3')
depends=('glibc')
makedepends=('go')
options=('!strip')

validpgpkeys=('7328F6E376924E4EE266381D3D9C808E038A615C')
sha256sums=('35ed29090930a2e9db27cb1dfa146f5e2b791170e9bb1e702a12f9ddd5f88ba8'
'9d005fd61f1340e7b7c03dc6e01e6c3202e28ad1b00be793b39b2bbcda9530c8')

source=("https://github.com/steffenfritz/pacaudit/archive/v0.3.0.tar.gz" "https://fritz.wtf/v$pkgver.tar.gz.asc")

build() {
    cd pacaudit-$pkgver
    go build -o pacaudit -ldflags "-s -w"
}

package() {
    install -Dm755 "$srcdir"/pacaudit-$pkgver/pacaudit "$pkgdir"/usr/bin/pacaudit
    install -Dm644 "$srcdir"/pacaudit-$pkgver/pacaudit.1 "${pkgdir}/usr/share/man/man1/pacaudit.1"
}

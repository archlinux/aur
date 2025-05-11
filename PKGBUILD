# Maintainer: ussur, Redchin Daniil <redchindaniil@gmail.com>

pkgname=switch-netns
pkgver=1.0.3
pkgrel=1
pkgdesc="CLI tool to change network namespaces without root access"
arch=('any')
url="https://github.com/USSURATONCACHI/switch-netns.git"
license=('MIT')
depends=('libcap')
makedepends=('base-devel' 'gengetopt')
source=("git+${url}#tag=v${pkgver}-${pkgrel}")
sha256sums=('33d24477fd84178c410e0cea6817560a78339a3ad9736597208ec6e803aeb0ba')

build() {
    cd "$srcdir/switch-netns"
    make build
}

package() {
    cd "$srcdir/switch-netns"
    install -Dm755 build-dir/switch-netns "$pkgdir/usr/bin/switch-netns"
	setcap cap_sys_admin,cap_sys_ptrace=ep "$pkgdir/usr/bin/switch-netns"
    
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

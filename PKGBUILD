# Maintainer: adelmonte
pkgname=arch-native
pkgver=1.2.0
pkgrel=1
pkgdesc="Rebuild installed pacman packages from source with CPU-optimized compiler flags"
arch=('any')
url="https://github.com/adelmonte/arch-native"
license=('GPL-3.0-or-later')
depends=('python' 'devtools' 'pacman' 'gnupg' 'rsync' 'git')
optdepends=(
    'nginx: to serve the local repo over HTTP'
    'artix-mirrorlist: for Artix Linux chroot support'
)
backup=('etc/arch-native.conf')
install=arch-native.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/adelmonte/arch-native/archive/refs/tags/arch-native-v${pkgver}.tar.gz")
sha256sums=('0eba55d8ad3dbf214d0e9129af1230c050bbeb848a0b637ac55fd4af52e1a26e')

package() {
    cd "$srcdir/arch-native-arch-native-v${pkgver}/arch-native"

    install -Dm755 buildbot                  "$pkgdir/usr/bin/buildbot"
    install -Dm644 buildbot_lib.py           "$pkgdir/usr/lib/arch-native/buildbot_lib.py"
    install -Dm644 arch-native.service       "$pkgdir/usr/lib/systemd/system/arch-native.service"
    install -Dm755 artix-meson               "$pkgdir/usr/share/arch-native/artix-meson"
    install -Dm644 artix-mirrorlist          "$pkgdir/usr/share/arch-native/artix-mirrorlist"
    install -Dm644 chroot-pacman.conf        "$pkgdir/usr/share/arch-native/chroot-pacman.conf"
    install -Dm644 nginx.conf                "$pkgdir/usr/share/arch-native/nginx.conf.example"
    install -Dm644 arch-native.conf          "$pkgdir/etc/arch-native.conf"
    install -Dm644 completions/buildbot.bash "$pkgdir/usr/share/bash-completion/completions/buildbot"
    install -Dm644 completions/_buildbot     "$pkgdir/usr/share/zsh/site-functions/_buildbot"
    install -Dm644 completions/buildbot.fish "$pkgdir/usr/share/fish/vendor_completions.d/buildbot.fish"
    install -Dm644 buildbot.1                "$pkgdir/usr/share/man/man1/buildbot.1"
    install -Dm644 sysusers.conf             "$pkgdir/usr/lib/sysusers.d/arch-native.conf"
    install -Dm644 ../LICENSE                "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

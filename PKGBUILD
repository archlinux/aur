# Maintainer: adelmonte
pkgname=arch-native
pkgver=1.4.0
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
sha256sums=('23d13d8125abb822a80828fd73563cd337a24d17cc89774fe871bfc6231eda30')

package() {
    cd "$srcdir/arch-native-arch-native-v${pkgver}/arch-native"

    install -Dm755 buildbot                  "$pkgdir/usr/bin/buildbot"
    install -Dm644 -t "$pkgdir/usr/lib/arch-native/arch_native" arch_native/*.py
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

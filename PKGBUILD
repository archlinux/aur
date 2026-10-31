# Maintainer: Sohimaster
pkgname=traur-bin
pkgver=0.5.0
pkgrel=1
pkgdesc='Trust scoring for AUR packages (prebuilt)'
arch=('x86_64')
url='https://github.com/Sohimaster/traur'
license=('MIT')
depends=('git' 'pacman' 'gcc-libs' 'glibc')
provides=('traur')
conflicts=('traur')
source=("$url/releases/download/v$pkgver/traur-$pkgver-x86_64.tar.gz")
sha256sums=('cb76a4f0c48cab8abe57f064466284010d0ab81a834227a5d875259283072ffe')

package() {
    # The release tarball should preserve the exec bit; set it explicitly so a
    # repacked or re-uploaded archive cannot ship non-runnable binaries (#3).
    chmod +x traur traur-hook
    install -Dm0755 traur "$pkgdir/usr/bin/traur"
    install -Dm0755 traur-hook "$pkgdir/usr/bin/traur-hook"
    install -Dm0644 traur.hook "$pkgdir/usr/share/libalpm/hooks/traur.hook"
    install -Dm0644 traur-scan.service "$pkgdir/usr/lib/systemd/system/traur-scan.service"
    install -Dm0644 traur-scan.timer "$pkgdir/usr/lib/systemd/system/traur-scan.timer"
    install -Dm0755 makepkg-wrapper.sh "$pkgdir/usr/share/traur/makepkg-wrapper.sh"
    install -Dm0644 patterns.toml "$pkgdir/usr/share/traur/patterns.toml"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

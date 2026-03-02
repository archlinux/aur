pkgname=hyprshell-bin
# x-release-please-start-version
pkgver=4.9.4
# x-release-please-end
pkgrel=1
pkgdesc="A modern GTK4-based window switcher and application launcher for Hyprland (binary release)"
arch=('x86_64' 'aarch64')
conflicts=('hyprshell')
provides=('hyprshell')
url="https://github.com/h3rmt/hyprshell/"
license=("MIT")
depends=('hyprland' 'gtk4-layer-shell' 'gtk4' 'gcc' 'pixman' 'libadwaita' 'zstd')
source_x86_64=("https://github.com/H3rmt/hyprshell/releases/download/v$pkgver/hyprshell-$pkgver-x86_64.tar.zst")
source_aarch64=("https://github.com/H3rmt/hyprshell/releases/download/v$pkgver/hyprshell-$pkgver-aarch64.tar.zst")

package() {
    install -Dm755 "hyprshell"                  "$pkgdir/usr/bin/hyprshell"
    install -Dm644 "LICENSE"                    "$pkgdir/usr/share/licenses/hyprshell/LICENSE"
    install -Dm644 "README.md"                  "$pkgdir/usr/share/doc/hyprshell/README.md"
    install -Dm644 "CONFIGURE.md"               "$pkgdir/usr/share/doc/hyprshell/CONFIGURE.md"
    install -Dm644 "DEBUG.md"                   "$pkgdir/usr/share/doc/hyprshell/DEBUG.md"
	install -Dm644 "hyprshell.service"          "$pkgdir/usr/lib/systemd/user/hyprshell.service"
	install -Dm644 "hyprshell-settings.png"     "$pkgdir/usr/share/pixmaps/hyprshell.png"
	install -Dm644 "hyprshell-settings.desktop" "$pkgdir/usr/share/applications/hyprshell-settings.desktop"

    mkdir "$pkgdir/usr/share/hyprshell"
    tar -xvf "usr-share.tar" -C "$pkgdir/usr/share/hyprshell"

    "$pkgdir/usr/bin/hyprshell" completions bash -p  "$pkgdir/usr/share/bash-completion/completions"
    "$pkgdir/usr/bin/hyprshell" completions fish -p  "$pkgdir/usr/share/fish/vendor_completions.d"
    "$pkgdir/usr/bin/hyprshell" completions zsh -p   "$pkgdir/usr/share/zsh/site-functions"
}
sha256sums_x86_64=('66fb54bcc540db667d6ffc544ff36058e9f73c31d7dfe5f7c9dd90da702a272e')
sha256sums_aarch64=('bd83b337f95392a9cdcf0182a12d7b1d546c5d6c74af79e4a7d81f0d4fdefa99')

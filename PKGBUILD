pkgname=hyprshell-bin
# x-release-please-start-version
pkgver=4.10.4
# x-release-please-end
pkgrel=1
pkgdesc="A modern GTK4-based window switcher and application launcher for Hyprland (binary release)"
arch=('x86_64' 'aarch64')
conflicts=('hyprshell')
provides=('hyprshell')
url="https://github.com/h3rmt/hyprshell/"
license=("MIT")
depends=('hyprland' 'gtk4-layer-shell' 'gtk4' 'libadwaita' 'zstd')
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
    tar -xvf "usr-share.tar" -C "$pkgdir/usr/share/hyprshell" | tee >(wc -l | xargs -I {} echo "Extracted {} files to $pkgdir/usr/share/hyprshell") > /dev/null

    "$pkgdir/usr/bin/hyprshell" completions bash -p  "$pkgdir/usr/share/bash-completion/completions"
    "$pkgdir/usr/bin/hyprshell" completions fish -p  "$pkgdir/usr/share/fish/vendor_completions.d"
    "$pkgdir/usr/bin/hyprshell" completions zsh -p   "$pkgdir/usr/share/zsh/site-functions"
}
sha256sums_x86_64=('1f15b343d70b89d58419f94337f0e2649d2770534cb45d6be18a3cfe681353b5')
sha256sums_aarch64=('d7b517ea092eda4e3344125838696ac8de8302ad87cc16f36129402698d415e4')

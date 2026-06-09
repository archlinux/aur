pkgname=hyprshell-bin
# x-release-please-start-version
pkgver=4.10.7
# x-release-please-end
pkgrel=1
pkgdesc="A modern GTK4-based window switcher and application launcher for Hyprland (binary release)"
arch=('x86_64' 'aarch64')
conflicts=('hyprshell')
provides=('hyprshell')
url="https://github.com/h3rmt/hyprshell/"
license=("MIT")
optdepends=('org.freedesktop.secrets: Store clipboard encryption in the keyring')
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
sha256sums_x86_64=('6c77e71b00afbc376ba79e2623e72a2cf9ec58e6de52c9a08297ae498539075a')
sha256sums_aarch64=('3ec596848f6026bf762b92a57eb5565403ddc3240b08983f367a7fbaba4b3775')

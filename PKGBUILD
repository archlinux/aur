STDIN
pkgname=uqm-full
pkgver=0.8.0
pkgrel=5
pkgdesc="Voice and 3DO music data pack for The Ur-Quan Masters (manual local install)"
arch=('any')
url="https://sc2.sourceforge.net/"
license=('GPL-1.0-or-later')
depends=('uqm')

# Note: The .uqm files must be placed manually in the build directory before running makepkg.
# Example:
#   cp ~/Downloads/uqm-0.8.0-voice.uqm .
#   cp ~/Downloads/uqm-0.8.0-3domusic.uqm .
#   makepkg -si

package() {
    install -d "${pkgdir}/usr/share/uqm/content/addons"
    install -d "${pkgdir}/usr/share/games/uqm/content/addons"

    for f in uqm-0.8.0-voice.uqm uqm-0.8.0-3domusic.uqm; do
        if [[ -f "\$f" ]]; then
            install -Dm644 "\$f" "\${pkgdir}/usr/share/uqm/content/addons/\$f"
            install -Dm644 "\$f" "\${pkgdir}/usr/share/games/uqm/content/addons/\$f"
        else
            echo "Missing file: \$f (please place it in the build directory before building)" >&2
            exit 1
        fi
    done

    install -Dm644 /dev/null "\${pkgdir}/usr/share/doc/\${pkgname}/README"
    echo "Installs The Ur-Quan Masters voice and 3DO music addon data.
These files are not distributed by this package. Download them from the official project and place them in the build directory before running makepkg." \
        > "\${pkgdir}/usr/share/doc/\${pkgname}/README"
}

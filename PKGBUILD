# Maintainer: PrettyZap contributors

# Omarchy Quattro integration for PrettyZap: the native bar widget is primary;
# the standalone widget is retained only as an explicit non-Omarchy fallback.
#
# Package installation never edits a user's configuration. After installing,
# run `prettyzap-omarchy-setup` once to copy the widget into
# ~/.config/omarchy/plugins/ and enable it (additive), and/or install the
# standalone widget to ~/.config/quickshell/prettyzap/.

pkgname=prettyzap-omarchy
pkgver=0.2.0
pkgrel=1
pkgdesc='Native Omarchy Quattro bar integration for PrettyZap with optional standalone fallback'
arch=('any')
url='https://github.com/prettyletto/prettyzap'
license=('MIT')
depends=('prettyzap-bin')
optdepends=('quickshell-git: runtime for the explicit standalone fallback outside Omarchy')
source=('LICENSE'
        'README.md'
        'omarchy-menu.jsonc'
        'install.sh'
        'plugin-manifest.json'
        'plugin-Widget.qml'
        'plugin-Data.qml'
        'plugin-README.md'
        'plugin-prettyzap-widget-dark.png'
        'plugin-prettyzap-widget-light.png'
        'plugin-prettyzap.svg'
        'standalone-shell.qml'
        'standalone-Data.qml'
        'standalone-README.md'
        'standalone-prettyzap.svg')
sha256sums=('e1353e4dde193ae18c47ba11139aad7e907f4609ae23e866d206e1d01e9f37b3'
            '15e552fbf775754c039007a585b6e0fcaa3f48e20ea8070d154a9c68d9b41c66'
            '8ddb13fcb770ef1546e9c9cc6f1a3e4e8627adb765a533c31488e4b1d9864219'
            '73cef8ff13e88ca274fab684120693e76fcf17d6daa3f543a5ab86df166aad87'
            'bb4cc703fecea9b2f5d6cef28da33d6a2e0a8a54664a7ffcc27432af6c251c86'
            'fc5cee8225c8acc48d6433170d68e0c2d8cb10c0dd9e67fda479337c935ece9e'
            '9feb726abbc78f55dafb0a89131d3de0ca75f6f7cbb22445d9b208f5cc12c42f'
            'c4cd45d43c9d4f2e7104ed9de18e5a43f1b4360cb407bd5b503885cf34d44131'
            '890c081711bc0e78638bd22e62b54c224173264e41892ae06eb66d77dbf0bc0c'
            'f2179968ee9e518e6c2ca724bb07f6f6d76305a89bcb157294c0348266113d70'
            'dc32d09b142dec2ace99bafae3f9e374e863c70d64e529ad815ac6ba51eb605a'
            '974e2d2cef50a0b94ecf46784b94aa5e67a9099da027d806a0842be67e3fad20'
            'df6b5a47d2f729ba1e4b13ee7231a2d11c2e5c12ef1510a61c09a7d1b0db4035'
            '43403c44a0c820cbb2a11fdcf2d5ba2ec090d2f6512f9432730540c308db4409'
            'dc32d09b142dec2ace99bafae3f9e374e863c70d64e529ad815ac6ba51eb605a')

package() {
  # Documentation and license
  install -Dm0644 "${srcdir}/README.md" \
    "${pkgdir}/usr/share/doc/prettyzap-omarchy/README.md"
  install -Dm0644 "${srcdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Command-menu entry (optional, merged by the user)
  install -Dm0644 "${srcdir}/omarchy-menu.jsonc" \
    "${pkgdir}/usr/share/prettyzap/omarchy/omarchy-menu.jsonc"

  # Omarchy bar-widget plugin (prettyletto.prettyzap)
  local pdir="${pkgdir}/usr/share/prettyzap/omarchy/plugin"
  install -Dm0644 "${srcdir}/plugin-manifest.json" "${pdir}/manifest.json"
  install -Dm0644 "${srcdir}/plugin-Widget.qml" "${pdir}/Widget.qml"
  install -Dm0644 "${srcdir}/plugin-Data.qml" "${pdir}/Data.qml"
  install -Dm0644 "${srcdir}/plugin-README.md" "${pdir}/README.md"
  install -Dm0644 "${srcdir}/plugin-prettyzap-widget-dark.png" "${pdir}/assets/prettyzap-widget-dark.png"
  install -Dm0644 "${srcdir}/plugin-prettyzap-widget-light.png" "${pdir}/assets/prettyzap-widget-light.png"
  install -Dm0644 "${srcdir}/plugin-prettyzap.svg" "${pdir}/assets/prettyzap.svg"

  # Standalone Quickshell widget
  local sdir="${pkgdir}/usr/share/prettyzap/omarchy/standalone"
  install -Dm0644 "${srcdir}/standalone-shell.qml" "${sdir}/shell.qml"
  install -Dm0644 "${srcdir}/standalone-Data.qml" "${sdir}/Data.qml"
  install -Dm0644 "${srcdir}/standalone-README.md" "${sdir}/README.md"
  install -Dm0644 "${srcdir}/standalone-prettyzap.svg" "${sdir}/assets/prettyzap.svg"

  # Installer + setup wrapper. The installer resolves its sources relative to
  # its own directory, which matches the layout above, so the wrapper is thin.
  install -Dm0755 "${srcdir}/install.sh" \
    "${pkgdir}/usr/share/prettyzap/omarchy/install.sh"
  install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/prettyzap-omarchy-setup" <<'EOF'
#!/bin/sh
# Install or remove the PrettyZap Omarchy/Quickshell integration.
#   prettyzap-omarchy-setup [--plugin] [--standalone] [--uninstall]
exec /usr/share/prettyzap/omarchy/install.sh "$@"
EOF
}

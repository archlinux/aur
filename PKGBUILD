# Maintainer: Helle Vaanzinn <glitsj16 at riseup dot net >

pkgname=firejail-handler-extra
pkgver=0.1.5
pkgrel=1
pkgdesc="BitTorrent/Youtube URL handlers for Firejail"
arch=(x86_64)
license=(GPL2)
url="https://github.com/glitsj16/firejail-handler-extra"
depends=('firejail' 'inotify-tools' 'xdg-user-dirs' 'xdg-utils')
# package contains only text files
options=(libtool !purge staticlibs !strip !zipman)
install=firejail-handler-extra.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/glitsj16/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1e342d7d8ee374009352548ecbe0fb091a82aefb6c0490e6017613e5af4ed096')

package() {
    cd "${pkgname}-${pkgver}"

    # main scripts
    for _script in "firejail-handler-bittorrent" "firejail-handler-bittorrent-ctl" "firejail-handler-youtube" "firejail-handler-youtube-ctl"; do
        install -Dm755 "$_script" "$pkgdir"/usr/bin/${_script}
    done

    # common script settings
    install -Dm644 firejail-handler-settings-extra.inc "$pkgdir"/etc/firejail/firejail-handler-settings-extra.inc

    # example user.js script for Youtube URL rewriting
    install -Dm644 fjyt.user.js "$pkgdir"/usr/share/doc/${pkgname}/fjyt.user.js

    # XDG autostart files
    for _xdg_autostart_file in "firejail-handler-bittorrent-ctl.desktop" "firejail-handler-youtube-ctl.desktop"; do
        install -Dm644 "$_xdg_autostart_file" "$pkgdir"/etc/xdg/autostart/${_xdg_autostart_file}
    done

    # XDG desktop files
    for _xdg_desktop_file in "firejail-handler-bittorrent.desktop" "firejail-handler-youtube.desktop"; do
        install -Dm644 "$_xdg_desktop_file" "$pkgdir"/usr/share/applications/${_xdg_desktop_file}
    done

    # license
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}

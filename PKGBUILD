# Maintainer: Helle Vaanzinn <glitsj16 at riseup dot net >

pkgname=firejail-handler-http
pkgver=0.1.3
pkgrel=2
pkgdesc="HTTP(S) URL handler for Firejail"
arch=(x86_64)
license=(GPL-2.0-or-later)
url="https://github.com/glitsj16/firejail-handler-http"
depends=('firejail' 'inotify-tools' 'xdg-user-dirs' 'xdg-utils')
# package contains only text files
options=(libtool !purge staticlibs !strip !zipman)
install=firejail-handler-http.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/glitsj16/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d578d5e0f45a7cba66d97de79c05a895258091981a966b2bfea25fe17f756d44')

package() {
    cd "${pkgname}-${pkgver}"

    # main scripts
    for _script in "firejail-handler-http" "firejail-handler-http-ctl"; do
        install -Dm755 "$_script" "$pkgdir"/usr/bin/${_script}
    done
    # common script settings
    install -Dm644 firejail-handler-settings-http.inc "$pkgdir"/etc/firejail/firejail-handler-settings-http.inc
    # xdg-open wrapper
    install -Dm755 firejail-xdg-open "$pkgdir"/usr/local/bin/xdg-open
    # XDG autostart file
    install -Dm644 firejail-handler-http-ctl.desktop "$pkgdir"/etc/xdg/autostart/firejail-handler-http-ctl.desktop
    # license
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}

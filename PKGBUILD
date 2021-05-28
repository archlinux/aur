# Maintainer: Helle Vaanzinn <glitsj16 at riseup dot net >

pkgname=firejail-handler-http
pkgver=0.1.2
pkgrel=1
pkgdesc="HTTP(S) URL handler for Firejail"
arch=(x86_64)
license=(GPL2)
url="https://github.com/glitsj16/firejail-handler-http"
depends=('firejail' 'inotify-tools' 'xdg-user-dirs' 'xdg-utils')
# package contains only text files
options=(libtool !purge staticlibs !strip !zipman)
install=firejail-handler-http.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/glitsj16/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('61d3a1647ee6358ff21ca3a407d74f6046d4af74d6248736904d2784a82941c9')

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

# Maintainer: Sergey Shatunov <me@aur.rocks>

pkgname=dracut-ukify
pkgver=2
pkgrel=1
pkgdesc="Integration layer for dracut and systemd's ukify tool for Arch Linux"
url="https://aur.archlinux.org/packages/dracut-ukify"
arch=(any)
license=('MIT')
depends=(dracut 'systemd>=253' python util-linux)
optdepends=(
	'sbsigntools: secureboot support'
)
source=('10-dracut-ukify-pre-install.hook'
        '90-dracut-ukify-install.hook'
        '60-dracut-ukify-remove.hook'
        'dracut-ukify'
        'dracut-ukify.conf')
sha256sums=('6778d79ce5542155cdf9d1b12e8e36b7b9b090b8f4b5d0c0ab8f9c21f9b79fe6'
            '08225b2c3f5e2a734561b5fa9a3e84060dfffd85b2898adb0fff0ce3b068b4d0'
            '341cd01546d840e7401f7bec868a78e2f6ca12563e93d993a07bc51efe674ed0'
            '793353048a655b67f5f6e47831493a1c62339b4b204b64d24fa44cdd493ae21f'
            'b2c523dc3b5dbda2a01ea43df3b9ab00bb48f70376445165cfdb2cf38e751eab')
backup=(etc/dracut-ukify.conf)
provides=(dracut-hook)
conflicts=(dracut-hook-uefi dracut-uefi-hook)

package() {
  install -Dm644 "${srcdir}/10-dracut-ukify-pre-install.hook" "${pkgdir}/usr/share/libalpm/hooks/10-dracut-ukify-pre-install.hook"
  install -Dm644 "${srcdir}/60-dracut-ukify-remove.hook"      "${pkgdir}/usr/share/libalpm/hooks/60-dracut-ukify-remove.hook"
  install -Dm644 "${srcdir}/90-dracut-ukify-install.hook"     "${pkgdir}/usr/share/libalpm/hooks/90-dracut-ukify-install.hook"
  install -Dm755 "${srcdir}/dracut-ukify"                     "${pkgdir}/usr/bin/dracut-ukify"
  install -Dm644 "${srcdir}/dracut-ukify.conf"                "${pkgdir}/etc/dracut-ukify.conf"
}

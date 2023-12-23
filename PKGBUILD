# Maintainer: Sergey Shatunov <me@aur.rocks>

pkgname=dracut-ukify
pkgver=6
pkgrel=5
pkgdesc="Integration layer for dracut and systemd's ukify tool for Arch Linux"
url="https://aur.archlinux.org/packages/dracut-ukify"
arch=(any)
license=('MIT')
depends=(dracut systemd-ukify python util-linux)
optdepends=(
	'sbsigntools: secureboot support'
)
source=('10-dracut-ukify-pre-install.hook'
        '90-dracut-ukify-install.hook'
        '60-dracut-ukify-remove.hook'
        'dracut-ukify'
        'dracut-ukify.conf')
sha256sums=('e9592f4f738e8ac70044db1e3f0c4839bc07f37662d5dbc221230cf1617a6b4d'
            '08225b2c3f5e2a734561b5fa9a3e84060dfffd85b2898adb0fff0ce3b068b4d0'
            '341cd01546d840e7401f7bec868a78e2f6ca12563e93d993a07bc51efe674ed0'
            '63757e1f635c967c3c4f4ff3b4edbc473be5f911bf6c5abd0f30a7e593ce2488'
            '2d49e6e4232639ed40caa5fdc2dc0fbc65ae64da81abb102ec51a77c2cf423b1')
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

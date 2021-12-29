# Maintainer: Xuanrui Qi <xuanrui@xuanruiwork>
pkgbase=rebuild-initramfs-dracut
pkgname=(rebuild-initramfs-dracut rebuild-initramfs-dracut-hook)
pkgver=1.7.3
pkgrel=1
arch=('any')
url="https://github.com/xuanruiqi/rebuild-initramfs-dracut-arch"
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/xuanruiqi/${pkgname}-arch/archive/${pkgver}.tar.gz")
sha256sums=('796aa436d468cf8e23a333dcc0ff230d6cd0224353a49e55832ce801c76ee0a5')

package_rebuild-initramfs-dracut() {
  pkgdesc="A helper script to rebuild initramfs images using dracut"
  depends=("dracut")
  optdepends=("sbsigntools: to sign kernel image")

  cd "${srcdir}/${pkgbase}-arch-${pkgver}"

  install -Dm755 rebuild-initramfs "${pkgdir}/usr/bin/rebuild-initramfs"
  install -Dm644 rebuild-initramfs.1 "${pkgdir}/usr/share/man/man1/rebuild-initramfs.1"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_rebuild-initramfs-dracut-hook() {
  pkgdesc="Install/remove hooks for dracut, based on rebuild-initramfs"
  depends=("rebuild-initramfs-dracut")
  backup=("etc/rebuild-initramfs.conf")

  cd "${srcdir}/${pkgbase}-arch-${pkgver}"

  install -Dm755 hooks/scripts/rebuild-initramfs-install "${pkgdir}/usr/share/libalpm/scripts/rebuild-initramfs-install"
  install -Dm755 hooks/scripts/rebuild-initramfs-remove "${pkgdir}/usr/share/libalpm/scripts/rebuild-initramfs-remove"
  install -Dm644 hooks/90-rebuild-initramfs-install.hook "${pkgdir}/usr/share/libalpm/hooks/90-rebuild-initramfs-install.hook"
  install -Dm644 hooks/60-rebuild-initramfs-remove.hook "${pkgdir}/usr/share/libalpm/hooks/60-rebuild-initramfs-remove.hook"
  install -Dm644 hooks/conf/rebuild-initramfs.conf "${pkgdir}/etc/rebuild-initramfs.conf"
}

# vim:set ts=2 sw=2 et:

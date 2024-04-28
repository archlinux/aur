# Maintainer: Xuanrui Qi <me@xuanruiqi.com>
_pkgbase=rebuild-initramfs-dracut-arch-legacy
pkgbase=rebuild-initramfs-dracut-legacy
pkgname=(rebuild-initramfs-dracut-legacy rebuild-initramfs-dracut-legacy-hook)
pkgver=1.7.4
pkgrel=3
arch=('any')
url="https://github.com/xuanruiqi/rebuild-initramfs-dracut-arch-legacy"
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/xuanruiqi/${_pkgbase}/archive/${pkgver}.tar.gz")
sha256sums=('aac15be547c46c0a0b7688dc94194fe7cbce7ee2c596e595986f419ce0686e1b')

package_rebuild-initramfs-dracut-legacy() {
  pkgdesc="A helper script to rebuild initramfs images using dracut (legacy shell script version)"
  depends=("dracut")
  optdepends=("sbsigntools: to sign kernel image")

  cd "${srcdir}/${_pkgbase}-${pkgver}"

  install -Dm755 rebuild-initramfs "${pkgdir}/usr/bin/rebuild-initramfs"
  install -Dm644 rebuild-initramfs.1 "${pkgdir}/usr/share/man/man1/rebuild-initramfs.1"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_rebuild-initramfs-dracut-legacy-hook() {
  pkgdesc="Install/remove hooks for dracut, based on rebuild-initramfs (legacy shell script version)"
  depends=("rebuild-initramfs-dracut-legacy")
  backup=("etc/rebuild-initramfs.conf")

  cd "${srcdir}/${_pkgbase}-${pkgver}"

  install -Dm755 hooks/scripts/rebuild-initramfs-install "${pkgdir}/usr/share/libalpm/scripts/rebuild-initramfs-install"
  install -Dm755 hooks/scripts/rebuild-initramfs-remove "${pkgdir}/usr/share/libalpm/scripts/rebuild-initramfs-remove"
  install -Dm644 hooks/90-rebuild-initramfs-install.hook "${pkgdir}/usr/share/libalpm/hooks/90-rebuild-initramfs-install.hook"
  install -Dm644 hooks/60-rebuild-initramfs-remove.hook "${pkgdir}/usr/share/libalpm/hooks/60-rebuild-initramfs-remove.hook"
  install -Dm644 hooks/conf/rebuild-initramfs.conf "${pkgdir}/etc/rebuild-initramfs.conf"
}

# vim:set ts=2 sw=2 et:

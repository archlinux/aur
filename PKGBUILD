# Maintainer:  dreieck ()
# Contributor: Philipp Born <philipp@tamcore.eu>
# Contributor: Max Roder <maxroder@web.de>

_pkgname='grub-imageboot'
pkgname="${_pkgname}"
pkgver='0.6+nmu2'
pkgrel='1'
pkgdesc="grub2 script to automatically add boot entries for iso images placed in /boot/images/"
url="https://launchpad.net/ubuntu/+source/grub-imageboot/"
arch=('any')
license=('GPL3')
depends=(
  'bash'
  'grub'
)
makedepends=(
  'syslinux' # To copy '/usr/lib/syslinux/bios/memdisk' to '/boot/memdisk'.
)
install='grub-imageboot.install'
_commit='529ac5d2bf91e7da8c31b9e15f37702127bddc1c'
source=(
  "https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/${_pkgname}/${pkgver}/${_pkgname}_${pkgver}.tar.xz"
  #"https://raw.githubusercontent.com/formorer/grub-imageboot/${_commit}/bin/60_grub-imageboot"
  #"https://raw.githubusercontent.com/formorer/grub-imageboot/${_commit}/etc/grub-imageboot"
)
sha256sums=(
  '5172c2bfa1cd7f569f6dfd18383c39016ea4490f87b3943db7473ec85795507b'
  #'462a9720ffa13ea9378bc485ecc1a88cbee59534a256627e9ba4ce029ed61b39'
  #'12602cea7b5d5b434007b891730a5071c3d2a06ed1cc225932e91d8a5d1f6c20'
)
options+=('emptydirs')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  # patch file
  sed -i 's/\/usr\/lib\/grub/\/usr\/share\/grub/g' "bin/60_grub-imageboot"
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  install -Dvm755 "bin/60_grub-imageboot" "${pkgdir}/etc/grub.d/60_grub-imageboot"
  install -Dvm644 "etc/grub-imageboot"    "${pkgdir}/etc/default/grub-imageboot"
  install -dvm755 "${pkgdir}/boot/images"

  install -Dvm644 "debian/changelog"  "${pkgdir}/usr/share/doc/${_pkgname}/changelog"
  install -Dvm644 "debian/docs"  "${pkgdir}/usr/share/doc/${_pkgname}/docs"
  install -Dvm644 "debian/README.Debian"  "${pkgdir}/usr/share/doc/${_pkgname}/README.Debian"

  install -Dvm644 "debian/copyright"  "${pkgdir}/usr/share/licenses/${pkgname}/copyright"
}

# vim:set ts=2 sw=2 et:

# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="alpine-make-vm-image"
pkgver=0.13.4
pkgrel=1
pkgdesc="Make customized Alpine Linux disk image for virtual machines"
arch=(
  'any'
)
url="https://github.com/alpinelinux/${pkgname}"
license=(
  'MIT'
)
depends=(
  'sh'
  'qemu-img'
)
makedepends=(
  'git'
)
optdepends=(
  'rsync: for --fs-skel-dir'
  'mdev: for --partition, --boot-mode UEFI'
  'e2fsprogs: for EXT4'
  'btrfs-progs: for BTRFS'
  'xfsprogs: for XFS'
  'dosfstools: for --boot-mode UEFI'
)
_pkgsrc="${url##*/}"
source=(
  "${_pkgsrc}::git+${url}.git#tag=v${pkgver}?signed"
)
sha256sums=('81a87a9a441d94b8e9433d37db1dc95473a19376d6052f830587df28f40f1e51')
validpgpkeys=(
  'D7858912669D3A20F4F46BD2F95BD679104D3115' # Jakub Jirutka <jakub@jirutka.cz>
)

package() {
  cd "${srcdir}/${_pkgsrc}"
  make PREFIX='/usr' DESTDIR="${pkgdir}" install

  install -vDm644 "README.adoc" "${pkgdir}/usr/share/doc/${pkgname}/README.adoc"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="alpine-make-vm-image"
pkgver=0.13.3
pkgrel=1
pkgdesc="Make customized Alpine Linux disk image for virtual machines"
arch=('any')
url="https://github.com/alpinelinux/${pkgname}"
license=('MIT')
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
source=("${_pkgsrc}::git+${url}.git#tag=v${pkgver}?signed")
sha256sums=('ddce7d65e4b44e7f8836b50a463c135c96637cf7bb94f63283398f83ee36a36e')
validpgpkeys=('D7858912669D3A20F4F46BD2F95BD679104D3115') # Jakub Jirutka <jakub@jirutka.cz>

package() {
  cd "${srcdir}/${_pkgsrc}"
  make PREFIX='/usr' DESTDIR="${pkgdir}" install

  install -vDm644 "README.adoc" "${pkgdir}/usr/share/doc/${pkgname}/README.adoc"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

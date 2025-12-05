# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Daniel Maurice Davis <daniel.maurice.davis@gmail.com>

pkgname="alpine-make-rootfs"
pkgver=0.8.1
pkgrel=1
pkgdesc="Make customized Alpine Linux rootfs (base image) for containers"
arch=('any')
url="https://github.com/alpinelinux/${pkgname}"
license=('MIT')
depends=(
  'sh'
  'wget'
)
makedepends=(
  'git'
)
_pkgsrc="${url##*/}"
source=("${_pkgsrc}::git+${url}.git#tag=v${pkgver}?signed")
sha256sums=('0645c7acf20295b59c2ef21ce4a7c709b34ea0a2785e707b0aabfd43dfc7bc37')
validpgpkeys=('D7858912669D3A20F4F46BD2F95BD679104D3115') # Jakub Jirutka <jakub@jirutka.cz>

package() {
  cd "${srcdir}/${_pkgsrc}"
  make PREFIX='/usr' DESTDIR="${pkgdir}" install

  install -vDm644 "README.adoc" "${pkgdir}/usr/share/doc/${pkgname}/README.adoc"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

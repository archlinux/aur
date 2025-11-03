# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Daniel Maurice Davis <daniel.maurice.davis@gmail.com>

pkgname="alpine-make-rootfs"
pkgver=0.7.2
pkgrel=2
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
sha256sums=('bcea5da00a69e97f1d4d2d4736ead6fbf7aa3216787bad51f263ce457a71260c')
validpgpkeys=('D7858912669D3A20F4F46BD2F95BD679104D3115') # Jakub Jirutka <jakub@jirutka.cz>

package() {
  cd "${srcdir}/${_pkgsrc}"
  make PREFIX='/usr' DESTDIR="${pkgdir}" install

  install -vDm644 "README.adoc" "${pkgdir}/usr/share/doc/${pkgname}/README.adoc"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

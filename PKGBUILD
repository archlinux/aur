# Maintainer: Jack Chu <alienchuj@gmail.com>
_basename="klib"
pkgname=${_basename}-git
pkgver=0.1.r365.f719aad
pkgrel=1
pkgdesc="A standalone and lightweight C library http://attractivechaos.github.io/klib/"
arch=('i686' 'x86_64')
url="http://attractivechaos.github.io/klib/"
license=('MIT/X11')
provides=(${_basename}=${pkgver})
conflicts=(${_basename})
source=(${_basename}::git+https://github.com/attractivechaos/${_basename}.git)
md5sums=('SKIP')

prepare() {
  cd "$srcdir/${_basename}"
  echo "0.1.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_basename}"

  mkdir -p "${pkgdir}/usr/include/${_basename}"

  cp ./*.c "${pkgdir}/usr/include/${_basename}"
  cp ./*.h "${pkgdir}/usr/include/${_basename}"
  cp -r ./cpp "${pkgdir}/usr/include/${_basename}/cpp"

  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_basename}/README"
}

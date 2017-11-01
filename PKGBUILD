# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname=pmonitor
pkgver=r15.97604f3
pkgrel=1
pkgdesc="Progress monitor: monitor a job's progress"
arch=('i686' 'x86_64')
url="https://github.com/dspinellis/pmonitor"
license=('Apache2.0')
depends=('lsof')
provides=('pmonitor')
conflicts=('pmonitor')
source=("git+https://github.com/dspinellis/pmonitor.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}"/"${pkgname}"

  make
}

package() {
  cd "${srcdir}"/"${pkgname}"

  mkdir -p "${pkgdir}"/usr/local/bin/
  mkdir -p "${pkgdir}"/usr/local/share/man/man1/
  mkdir -p "${pkgdir}"/usr/share/licenses/"${pkgname}"/

  cp "${srcdir}"/"${pkgname}"/"${pkgname}" "${pkgdir}"/usr/local/bin/"${pkgname}"

  install -m 644 pmonitor.1 "${pkgdir}"/usr/local/share/man/man1
  install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}

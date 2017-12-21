# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname=pmonitor-git
pkgver=r15.97604f3
pkgrel=2
pkgdesc="Progress monitor: monitor a job's progress"
arch=('i686' 'x86_64')
url=https://github.com/dspinellis/"${pkgname//-git/}"
license=('Apache2.0')
depends=('lsof')
provides=('pmonitor')
conflicts=('pmonitor')
source=(git+https://github.com/dspinellis/"${pkgname//-git/}".git)
md5sums=('SKIP')

pkgver() {
  cd "${pkgname//-git/}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}"/"${pkgname//-git/}"
  make
}

package() {
  cd "${srcdir}"/"${pkgname//-git/}"

  mkdir -p "${pkgdir}"/usr/local/bin/
  mkdir -p "${pkgdir}"/usr/local/share/man/man1/
  mkdir -p "${pkgdir}"/usr/share/licenses/"${pkgname//-git/}"/

  cp "${srcdir}"/"${pkgname//-git/}"/"${pkgname//-git/}" "${pkgdir}"/usr/local/bin/"${pkgname//-git/}"

  install -m 644 pmonitor.1 "${pkgdir}"/usr/local/share/man/man1
  install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname//-git/}"/LICENSE
}

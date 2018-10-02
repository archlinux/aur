# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='ethq'
pkgver=13.39e89ba
pkgrel=1
pkgdesc='Displays an auto-updating per-second count of the number of packets and bytes being handled by each queue on a multi-queue NIC.'
arch=('any')
url="https://github.com/isc-projects/${pkgname}"
license=('MPL')
depends=('ncurses')
makedepends=('git')
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git_num=`git log --pretty=oneline | wc -l | tr -d '[[:space:]]'`
  git_tag=`git log -1 --format=%h`
  echo -e "${git_num}.${git_tag}"
}

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

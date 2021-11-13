# Maintainer: Danil <ddddanil@manjaro>
pkgname=dyalog-jupyter-git
pkgver=r143.7039739
pkgrel=1
pkgdesc="Jupyter kernel for Dyalog APL"
arch=('any')
url="https://github.com/Dyalog/dyalog-jupyter-kernel"
license=('MIT')
depends=("python" "jupyter")
makedepends=("sed")
conflicts=("dyalog-jupyter")
provides=("dyalog-jupyter")
source=("git+https://github.com/Dyalog/dyalog-jupyter-kernel.git")
sha256sums=(SKIP)

pkgver() {
  cd "dyalog-jupyter-kernel"
  ( set -o pipefail
	  git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
	    || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

package() {
  cd "dyalog-jupyter-kernel"
  PYVER="$(python3 --version | sed 's/.*\(3\.[0-9]*\).*/\1/')"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}" && cp "LICENSE" "$_"

  install -dm755 "${pkgdir}/usr/lib/python${PYVER}/site_packages/dyalog_kernel/" && cp -r "dyalog_kernel/"* "$_"

  install -dm755 "${pkgdir}/usr/share/jupyter/kernels/dyalog-kernel/" && cp -r "dyalog-kernel/"* "$_"
}

# vim:set ts=2 sw=2 et:

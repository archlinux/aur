# Maintainer: AnnikaV9 <carrot.moncher@gmail.com>

pkgname=hcclient
pkgver=1.18.3
pkgrel=2
pkgdesc="A terminal client for hack.chat"
arch=("x86_64")
url="https://github.com/AnnikaV9/hcclient"
license=("Unlicense")
provides=("hcclient")
depends=("python")
makedepends=("python-pip" "python-wheel") 
source=("v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a8d36fa7f18fff156ce34d6b5d7c1a6b1bdb89a8a62e73ff804bec01d9b0cd6c')

build() {
  cd "${srcdir}/hcclient-${pkgver}"
  RELEASE_VERSION=true NO_ANSI=true bash scripts/build.sh
  python -m venv venv
  ./venv/bin/pip install --disable-pip-version-check --no-color dist/hcclient-${pkgver}-py3-none-any.whl
}

package() {
  install -Dm755 "${srcdir}/hcclient-${pkgver}/scripts/arch_entry.py" "${pkgdir}/usr/bin/hcclient"
  mkdir "${pkgdir}/opt"
  cp -a "${srcdir}/hcclient-${pkgver}/venv" "${pkgdir}/opt/hcclient"
  install -Dm644 "${srcdir}/hcclient-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/hcclient/LICENSE"
}

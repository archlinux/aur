# Maintainer: AnnikaV9 <carrot.moncher@gmail.com>

pkgname=hcclient
pkgver=1.19.0
pkgrel=1
pkgdesc="A terminal client for hack.chat"
arch=("x86_64")
url="https://github.com/AnnikaV9/hcclient"
license=("Unlicense")
provides=("hcclient")
depends=("python")
makedepends=("python-pip" "python-wheel") 
source=(
  "${url}/releases/download/v${pkgver}/hcclient-$pkgver-py3-none-any.whl"
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
noextract=("hcclient-${pkgver}-py3-none-any.whl")
sha256sums=(
  '00faf769abcf4e8fe0bc83090052af39dcf8d63ff32a65364ff888d231ddc68c'
  'f64677c09bdcd6cf60f23e34ebd2a83b39b95b5cb0058761b0592e947f350b4a'
)

build() {
  python -m venv iso-env
  ./iso-env/bin/pip install --disable-pip-version-check --no-color "hcclient-${pkgver}-py3-none-any.whl"
  ./iso-env/bin/pip uninstall setuptools pip -y --quiet
  rm -f iso-env/bin/{activate,activate.*,Activate,Activate.*}
}

package() {
  install -Dm755 "${srcdir}/hcclient-${pkgver}/scripts/arch_entry.py" "${pkgdir}/usr/bin/hcclient"
  mkdir "${pkgdir}/opt"
  cp -a "${srcdir}/iso-env" "${pkgdir}/opt/hcclient"
  install -Dm644 "${srcdir}/hcclient-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/hcclient/LICENSE"
}


# Maintainer: AnnikaV9 <carrot.moncher@gmail.com>

pkgname=hcclient-latex
pkgver=1.18.6
pkgrel=1
pkgdesc="A terminal client for hack.chat, with LaTeX support"
arch=("x86_64")
url="https://github.com/AnnikaV9/hcclient"
license=("Unlicense")
provides=("hcclient")
conflicts=("hcclient")
depends=("python")
makedepends=("python-pip" "python-wheel") 
source=(
  "${url}/releases/download/v${pkgver}/hcclient-$pkgver-py3-none-any.whl"
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
noextract=("hcclient-${pkgver}-py3-none-any.whl")
sha256sums=(
  '66b9098f5268bfebf9f7cad39a42a04a1d49300254020b6891410dd481be75a7'
  'ab35243a5a91d1c04d2ec2d0a6702ed67a8709f21daa9deb6c32ffb445648f74'
)

build() {
  python -m venv iso-env
  ./iso-env/bin/pip install --disable-pip-version-check --no-color "hcclient-${pkgver}-py3-none-any.whl[latex]"
  ./iso-env/bin/pip uninstall setuptools pip -y --quiet
  rm -f iso-env/bin/{activate,activate.*,Activate,Activate.*}
}

package() {
  install -Dm755 "${srcdir}/hcclient-${pkgver}/scripts/arch_entry.py" "${pkgdir}/usr/bin/hcclient"
  mkdir "${pkgdir}/opt"
  cp -a "${srcdir}/iso-env" "${pkgdir}/opt/hcclient"
  install -Dm644 "${srcdir}/hcclient-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/hcclient/LICENSE"
}

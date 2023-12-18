# Maintainer: AnnikaV9 <carrot.moncher@gmail.com>

pkgname=hcclient-latex
pkgver=1.18.4
pkgrel=7
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
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v1.18.4.tar.gz"
)
noextract=("hcclient-${pkgver}-py3-none-any.whl")
sha256sums=(
  '6805fe0ae87daa677a8efb834d38c7964aeccc9fc49146c5e2f789499ece7731'
  '41140c9bbebf4571c410af485c0c524157d4bf51c08bd6197666af9ff09cea91'
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

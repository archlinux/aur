# Maintainer: AnnikaV9 <carrot.moncher@gmail.com>

pkgname=hcclient-latex
pkgver=1.18.5
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
  'f4255e4d5d0f9646717c503fe8b8e32a9c58f7f28057acacf0a58b5de6900098'
  '6b6062a9f88be300550bbf49888e8c686a807ee6b3bd7ef1ce88cd893ea860f6'
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

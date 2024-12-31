# Maintainer: AnnikaV9 <carrot.moncher@gmail.com>

pkgname=hcclient-latex
pkgver=1.19.7
pkgrel=1
pkgdesc="A terminal client for hack.chat, with LaTeX support"
arch=("any")
url="https://github.com/AnnikaV9/hcclient"
license=("Unlicense")
provides=("hcclient")
conflicts=("hcclient")
depends=("python")
makedepends=("python-pip" "python-wheel") 
source=("hcclient-${pkgver}-py3-none-any.whl::${url}/releases/download/v${pkgver}/hcclient-${pkgver}-py3-none-any.whl"
        "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
noextract=("hcclient-${pkgver}-py3-none-any.whl")
sha256sums=('a086c4821ddfd0458347500ae0dfad8db14f06b96a24fb0ed1e64f757eacd250'
            '94ae198364535ae893dbe60ee6e110cd6d5b60bb1bc086a1a0f866e1bcc8574e')

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

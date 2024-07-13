# Maintainer: AnnikaV9 <carrot.moncher@gmail.com>

pkgname=hcclient
pkgver=1.19.6
pkgrel=1
pkgdesc="A terminal client for hack.chat"
arch=("any")
url="https://github.com/AnnikaV9/hcclient"
license=("Unlicense")
provides=("hcclient")
depends=("python")
makedepends=("python-pip" "python-wheel") 
source=("hcclient-${pkgver}-py3-none-any.whl::${url}/releases/download/v${pkgver}/hcclient-${pkgver}-py3-none-any.whl"
        "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
noextract=("hcclient-${pkgver}-py3-none-any.whl")
sha256sums=('c63eb1120a87689d971d952e5125568746e68ae00986c8a155ec00bb1add3838'
            '793f72548b7f1bb7c073b3b8b78c6c17b64fca0e2aa12062d5b212374f312c1f')

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


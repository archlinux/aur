# Maintainer: AnnikaV9 <carrot.moncher@gmail.com>

pkgname=hcclient
pkgver=1.19.5
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
sha256sums=('eef2c2098cc2b91fbeef2d0bb8f5e2dbdf025a1c18255bd860eeada9d218fa83'
            'e94257871e63b864c76f89437478ee46086250aa00beb81abd8b8cd2fc03fc9c')


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


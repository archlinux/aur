# Maintainer: AnnikaV9 <carrot.moncher@gmail.com>

pkgname=hcclient-latex
pkgver=1.19.3
pkgrel=1
pkgdesc="A terminal client for hack.chat, with LaTeX support"
arch=("x86_64")
url="https://github.com/AnnikaV9/hcclient"
license=("Unlicense")
provides=("hcclient")
conflicts=("hcclient")
depends=("python")
makedepends=("python-pip" "python-wheel") 
source=("hcclient-${pkgver}-py3-none-any.whl::${url}/releases/download/v${pkgver}/hcclient-${pkgver}-py3-none-any.whl"
        "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
noextract=("hcclient-${pkgver}-py3-none-any.whl")
sha256sums=('01e8fe70d4401594d7ee2eeeabc8f4084d41f6162e7f40d66489ae561989baf9'
            '820d66751f829ec2017686146ac2876396b8fb1e9b4488e7a57da87030f6fdbc')

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

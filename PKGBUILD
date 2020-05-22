# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=cloudbeaver-ce
pkgver=1.0.2
pkgrel=1
pkgdesc="Cloud Database Manager"
arch=('any')
url='https://github.com/dbeaver/cloudbeaver'
license=('Apache')
install=cloudbeaver-ce.install
depends=('bash' 'java-runtime')
options=('!strip' '!emptydirs')
source=("${pkgname}-${pkgver}.zip::https://github.com/dbeaver/cloudbeaver/releases/download/${pkgver}/cloudbeaver-ce-${pkgver}.zip")
sha256sums=('4d1bde0d5220b4b778ed6fcd728f4111372d8fe633c59911c015c12246b827b5')

package() {
  install -d "${pkgdir}/usr/share/" "${pkgdir}/usr/bin/"
  echo "#!/usr/bin/env bash
  if [[ "\$EUID" -ne 0 ]]; then
    echo "root privileges required" 1>&2
    exit 1
  fi
  cd /usr/share/cloudbeaver-ce/
  ./run-server.sh" > cloudbeaver-ce.sh
  cp -aR "${pkgname}-${pkgver}" "${pkgdir}/usr/share/${pkgname}"
  install -Dm755 cloudbeaver-ce.sh "${pkgdir}/usr/bin/cloudbeaver-ce"
}
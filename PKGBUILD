# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=cloudbeaver-ce
pkgver=1.2.0
pkgrel=1
pkgdesc="Cloud Database Manager"
arch=('any')
url='https://github.com/dbeaver/cloudbeaver'
license=('Apache')
install=cloudbeaver-ce.install
depends=('bash' 'java-runtime')
options=('!strip' '!emptydirs')
source=("${pkgname}-${pkgver}.zip::https://github.com/dbeaver/cloudbeaver/releases/download/${pkgver}/cloudbeaver-ce-${pkgver}.zip")
sha256sums=('b80690fe8793ebaeab599e4969aa139e47cde1d03a5f8e479b688d9de0b61cd9')

package() {
  install -d "${pkgdir}/usr/share/" "${pkgdir}/usr/bin/"
  echo "#!/usr/bin/env bash
  if [[ "\$EUID" -ne 0 ]]; then
    echo "root privileges required" 1>&2
    exit 1
  fi
  cd /usr/share/cloudbeaver-ce/
  ./run-server.sh" > cloudbeaver-ce.sh
  cp -aR "${pkgname}-1.4.0" "${pkgdir}/usr/share/${pkgname}"
  install -Dm755 cloudbeaver-ce.sh "${pkgdir}/usr/bin/cloudbeaver-ce"
}

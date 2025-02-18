# Maintainer: Kazuya Yokogawa <mapk0y at gmail.com>
pkgname='alibabacloud-sso-cli'
_npm_pkgname=@alicloud/sso-cli
pkgver=1.3.2
pkgrel=2
pkgdesc='Alibaba Cloud SSO CLI'
url='https://github.com/aliyun/alibabacloud-sso-cli/'

_excname=acs-sso
license=('Apache-2.0')
arch=('any')
depends=('nodejs>=16')
makedepends=(npm)
conflicts=()
source=()

# https://registry.npmjs.org/@alicloud/sso-cli/-/sso-cli-1.3.2.tgz
source=(
  "https://registry.npmjs.org/${_npm_pkgname}/-/${_npm_pkgname#*/}-${pkgver}.tgz"
)
sha256sums=('ff8a06b4e36ca4543fabb0874df841235107a5df12a69415bfb4d0678ed300ef')

build() {
  echo "complete -C acs-sso acs-sso" > acs-sso.bash
}

package() {
  local _npmdir="${pkgdir}/usr/lib/node_modules/"
  mkdir -pv "${_npmdir}"
  npm install -g --prefix "${pkgdir}/usr" ${_npm_pkgname}@${pkgver}
  chown 0:0 -R "${pkgdir}"
  install -Dm644 ${srcdir}/package/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 ${srcdir}/acs-sso.bash "${pkgdir}/usr/share/bash-completion/completions/acs-sso"
}


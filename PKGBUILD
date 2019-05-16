# Maintainer: Jack O'Sullivan <jackos1998 at gmail dot com>

_pkgbase=riot
_pkgver=323
_src=riot-6f8c6bf13e1d-react-0e3d4fbc0c88-js-fbf53524ed26
pkgname=riot-web-develop-bin
pkgver=b323
pkgrel=1
pkgdesc="A glossy Matrix collaboration client for the web (develop branch)."
arch=('any')
url="https://riot.im"
_url="https://github.com/vector-im/riot-web"
license=('Apache')
makedepends=('npm' 'git')
source=("${_src}.tar.gz::https://buildkite.com/organizations/matrix-dot-org/pipelines/riot-web/builds/${_pkgver}/jobs/250aea95-79d7-4043-b256-67e1341b9539/artifacts/47c9b22f-70fc-4842-8c3d-8c1b265fc4ca")
sha256sums=('fc85fa9fc56cd93e2c3a397998c0568790d9d84adbeb2fdc6316ee1babaefdd8')
provides=('vector-web')  # @vith
replaces=('vector-web')  # @vith
conflicts=('vector-web')

package() {
  cd ${_src}

  install -d "${pkgdir}"/{usr/share/webapps,etc/webapps}/${_pkgbase}

  cp -r * "${pkgdir}"/usr/share/webapps/${_pkgbase}/
  install -Dm644 config.sample.json -t "${pkgdir}"/etc/webapps/${_pkgbase}/
  ln -s /etc/webapps/${_pkgbase}/config.json "${pkgdir}"/usr/share/webapps/${_pkgbase}/
  echo "${pkgver}" > "${pkgdir}"/usr/share/webapps/${_pkgbase}/version
}

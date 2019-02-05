# Maintainer: Jack O'Sullivan <jackos1998 at gmail dot com>

_pkgbase=riot-web
_pkgver=4715
_src=riot-8630d0319dcc-react-94f6f65fac95-js-6f17e3e659a0
pkgname=riot-web-develop-bin
pkgver=b4715
pkgrel=1
pkgdesc="A glossy Matrix collaboration client for the web (develop branch)."
arch=('any')
url="https://riot.im"
_url="https://github.com/vector-im/riot-web"
license=('Apache')
makedepends=('npm' 'git')
source=("https://matrix.org/jenkins/job/VectorWebDevelop/${_pkgver}/artifact/dist/${_src}.tar.gz")
sha256sums=('53e9267f2414d448f32a0200b22e1781520d9b8052490d89c4314ead80c8e754')
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

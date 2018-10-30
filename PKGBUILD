# Maintainer: Carlos Bellino <carlosbellino@gmail.com>

pkgname=sickchill
_gitname=SickChill
_gitauthor=SickChill
_sickchill_dir="/opt/sickchill"
pkgver=2018.10.29
pkgrel=2
pkgdesc="Automatic Video Library Manager for TV Shows. It watches for new episodes of your favorite shows, and when they are posted it does its magic."
arch=('any')
url="https://github.com/${_gitauthor}/${_gitname}"
license=('GPL3')

depends=('nodejs'
         'python2-babel'
         'python2-cheetah'
         'python2-mako')

optdepends=('python2-notify'
            'unrar')

conflicts=(${_pkgname}
           'pymedusa'
           'sickbeard'
           'sickrage'
           'sickrage-git'
           'sickrage2-git'
           'sickgear-git')

options=('!strip')
install=${pkgname}.install

source=("https://github.com/${_gitauthor}/${_gitname}/archive/v${pkgver}-${pkgrel}.tar.gz"
        "${pkgname}.service"
        "${pkgname}.install")

md5sums=('a159f17056aaca059dfc67b4155f5bb0'
         '373832300e91a4011285eb8d6df9cef0'
         '961815f362818fa961c37c70199c5b6f')

package() {
  install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -dm755 "${pkgdir}${_sickchill_dir}"/{app,data}

  cp -rp "${srcdir}/${_gitname}-${pkgver}-${pkgrel}"/* "${pkgdir}${_sickchill_dir}"/app/
}

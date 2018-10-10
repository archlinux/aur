# Maintainer: Carlos Bellino <carlosbellino@gmail.com>

pkgname=sickrage
_gitname=SickChill
_gitauthor=SickChill
_sickrage_dir="/opt/sickrage"
pkgver=2018.10.10
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
           'sickrage-git'
           'sickrage2-git'
           'sickgear-git')

options=('!strip')
install=${pkgname}.install

source=("https://github.com/${_gitauthor}/${_gitname}/archive/v${pkgver}-${pkgrel}.tar.gz"
        "${pkgname}.service"
        "${pkgname}.install")

md5sums=('8987a29f22bd85f083b93b70370dc498'
         '18e8ac10a90c7eb3cc596caa02261a3e'
         'ac4c96c5d3b7b4a86c653929c5f4aa60')

package() {
  install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -dm755 "${pkgdir}${_sickrage_dir}"/{app,data}

  cp -rp "${srcdir}/${_gitname}-${pkgver}-${pkgrel}"/* "${pkgdir}${_sickrage_dir}"/app/
}

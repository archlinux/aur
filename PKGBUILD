# Maintainer: Carlos Bellino <carlosbellino@gmail.com>

pkgname=pymedusa
_gitname=Medusa
_gitauthor=pymedusa
_pymedusa_dir="/opt/medusa"
pkgver=13476.ccbc0ce9a
pkgrel=1
pkgdesc="Automatic Video Library Manager for TV Shows. It watches for new episodes of your favorite shows, and when they are posted it does its magic."
arch=('any')
url="https://github.com/${_gitauthor}/${_gitname}"
license=('GPL')
depends=('python2-babel' 'python2-cheetah' 'python2-mako')
optdepends=('python2-notify' 'unrar')
conflicts=(${_pkgname}
           'sickbeard'
           'sickrage'
           'sickrage-git'
           'sickrage2-git'
           'sickgear-git')
makedepends=('git')
install=$pkgname.install
source=("git://github.com/${_gitauthor}/${_gitname}.git" "${pkgname}.service" "${pkgname}.install")
md5sums=('SKIP' 'a7d53eaed59f1e268aea8f73829d0b4c' '188855fff23f878fcd9f8e5b498e0dd3')

pkgver() {
  cd ${_gitname}
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -dm755 "${pkgdir}${_pymedusa_dir}"/{app,data}
  
  cp -rp "$srcdir/$_gitname"/* "${pkgdir}${_pymedusa_dir}"/app/
}

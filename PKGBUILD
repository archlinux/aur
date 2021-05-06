# Maintainer: jasonwryan <jasonwryan@gmail.com>

pkgname=nodejs-airfile-git
_name=airfile
pkgver=2019.10.23
pkgrel=1
pkgdesc="Transfer files from android to your local machine"
arch=('any')
url="https://github.com/noffle/${_name}"
depends=('nodejs')
makedepends=('npm' 'git')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
license=('ISC')
source=("${_name}::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_name}"
  git log -1 --format="%cd" --date=short | sed 's/-/./g'
}

package() {
  cd "${srcdir}/${_name}"
  npm install -g --prefix "$pkgdir/usr" "${source[@]##*/}"
  find "${pkgdir}"/usr -type d -exec chmod 755 {} +
  install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$_name/LICENSE"
}


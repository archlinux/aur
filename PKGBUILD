# Maintainer: Roshless <pkg@roshless.com>

pkgname=nnrss-git
pkgver=1.3.1.r18.g27a17bf
pkgrel=2
pkgdesc='Web/API RSS aggregator - git master'
url='https://git.roshless.me/nnrss/nnrss'
arch=('any')
license=('GPL')
depends=('python-flask' 'python-sqlalchemy' 'python-werkzeug'
	 'python-feedparser' 'python-listparser' 'python-apscheduler'
	 'python-pyaml' 'python-wtforms')
makedepends=('python-setuptools' 'git')
provides=('nnrss')
conflicts=('nnrss')
install='nnrss.install'
source=("nnrss-git::git+https://git.roshless.me/nnrss/${pkgname%-git}"
        "nnrss.sysusers"
        "nnrss.tmpfiles")

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $pkgname
  python setup.py build
}

package() {
  install -Dm644 ${pkgname%-git}.sysusers "$pkgdir/usr/lib/sysusers.d/${pkgname%-git}.conf"
  install -Dm644 ${pkgname%-git}.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/${pkgname%-git}.conf"

  cd $pkgname
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

md5sums=('SKIP'
         '8b9a147720fbe9f6c013f6aa7dbb8140'
         '364b51a829d7cf46a9557b97f8d3ce28')

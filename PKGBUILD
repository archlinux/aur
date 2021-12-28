# Maintainer: Gabriel Matthews <matthewriel63@gmail.com>

pkgname="movies-dl-git"
_pkgname="movies-dl"
pkgver=r74.24fad55
pkgrel=1
pkgdesc="The python program that lets you download movies for free."
arch=('any')
url="https://github.com/Kungger-git/movies-dl"
license=('GPL3')
# Note: Dependencies from setup.py must be defined in the depends array otherwise they will not be installed.
depends=('qbittorrent' 'qbittorrent-nox')
# makedepends=('git')
# checkdepends=('python-jaraco.envs' 'python-jaraco.path' 'python-mock' 'python-pip'
#               'python-pytest-fixture-config' 'python-pytest-flake8' 'python-pytest-virtualenv'
#               'python-wheel' 'python-paver' 'python-pytest-cov' 'python-sphinx')


source=("$_pkgname::git+$url.git")
md5sums=('SKIP')
install='post.install'

pkgver() {
        cd "$srcdir/${_pkgname}"
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  python3 ../../setup.py build
}

package() {
  cd "$srcdir/$_pkgname"
  # python3 -m pip --version
  python3 ../../setup.py install --root="$pkgdir" --optimize=1 --skip-build
 
  install -dm755 "$pkgdir"/usr/share/
  cp -rf "$srcdir/$_pkgname" "$pkgdir"/usr/share/
}

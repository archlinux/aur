# Maintainer: Mario Finelli <mario at finel dot li>

_pkgname=backblaze-b2
_reponame="B2_Command_Line_Tool"

pkgname=${_pkgname}-git
pkgver=r1710.1ddcc6e
pkgrel=1
pkgdesc="Backblaze B2 Command Line Client"
arch=(any)
url="https://www.backblaze.com/b2/cloud-storage.html"
license=(MIT)
depends=(python python-b2sdk python-tqdm python-class-registry)
makedepends=(git python-setuptools)
provides=($_pkgname)
conflicts=($_pkgname)
source=("git+https://github.com/Backblaze/${_reponame}.git")
md5sums=('SKIP')

pkgver() {
  cd "$_reponame"
  printf "r%s.%s" "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_reponame"
  python setup.py build
}

package() {
  cd "$_reponame"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm0644 contrib/bash_completion/b2 "$pkgdir/etc/bash_completion.d/b2"
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

# vim: set ts=2 sw=2 et:

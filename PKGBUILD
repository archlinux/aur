# Maintainer: Gustav Åkertröm <gustavakerstrom@gmail.com>

pkgname="syncall-git"
_gitname="syncall"
pkgver=r236.1a0fb90
pkgrel=1
pkgdesc="Bi-directional synchronization between services such as Taskwarrior, Google Calendar, Notion, Asana, and more"
url="https://github.com/gustavakerstrom/syncall"
arch=("i686" "x86_64")
licence=("MIT")
depends=(
  "python>=3.8" "python-yaml>=5.3.1" "python-bidict>=0.21.4" "python-click>=8.1.7"
  "python-loguru>=0.5.3" "python-dateutil>=2.9.0" "python-item_synchronizer>=1.1.5" 
  "python-bubop>=0.1.12" "python-setuptools>=72.1.0"
)
makedepends=(
  "git" "python-build" "python-installer"
  "python-poetry-core>=1.0.0" "python-poetry-dynamic-versioning>=1.0.0"
  )
optdepends=(
  "python-asana>=1.0.0" 
  "python-caldav>=0.11.0" 
  "python-icalendar>=5.0.13"
  "task>=2.6"
  "python-taskw-ng>=0.2.7"
  "python-xattr>=0.99.9"
  "python-pyxdg>=0.28"
  "python-google-api-python-client"
  "python-google-auth-oauthlib"
  "python-gkeepapi"
  "python-notion-client"
)

provides=("syncall")
conflicts=("syncall")

source=("git+https://github.com/gustavakerstrom/syncall.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$srcdir/$_gitname"
  python -m build --wheel 
}

package() {
  cd "$srcdir/$_gitname"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
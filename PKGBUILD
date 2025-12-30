# Maintainer: Jaël Champagne Gareau <gareau_jael@hotmail.com>
# Contributor:
_pkgname=ChatMock
pkgname=chatmock-git
pkgver=1.35+4+gf15c880
pkgrel=1
pkgdesc="OpenAI & Ollama compatible API powered by your ChatGPT plan"
arch=('any')
url="https://github.com/RayBytes/ChatMock"
license=('MIT')
depends=(
  'python'
  'python-requests'
  'python-flask'
  'python-click'
  'python-itsdangerous'
  'python-jinja'
  'python-werkzeug'
  'python-blinker'
  'python-certifi'
  'python-urllib3'
  'python-markupsafe'
  'python-idna'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
provides=('chatmock')
conflicts=('chatmock')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//; s/-/+/g' || printf '%s+%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  pyproject-build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
